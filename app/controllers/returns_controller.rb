require 'csv'

class ReturnsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @manufacturers = Manufacturer.all.order(:name)
    @brands = Brand.all.order(:name)
    @returns = Return.all.order(:return_date)
    @pending = Return.where("credit_memo_number = '' OR credit_memo_number IS NULL").order(:return_date)
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "returns"
      end
      format.xls { send_data @returns.to_csv(col_sep: "\t") }
    end
  end

  def show
    @return = Return.find(params[:id])
    if request.xhr?
      render 'show', layout: false
    end
  end

  def new
    @return = Return.new
  end

  def edit
    @return = Return.find(params[:id])
    @brands = Manufacturer.find(@return.manufacturer_id).brands
  end

  def create
    @return = Return.new(return_params)

    if @return.save
      flash[:notice] = "Return successfully created"
      redirect_to returns_path
    else
      @brands = Manufacturer.find(params["return"]["manufacturer_id"]).brands if params["return"]["manufacturer_id"] != ""
      render 'new'
    end
  end

  def update
    @return = Return.find(params[:id])

    if @return.update(return_params)
      flash[:notice] = "Return successfully updated"
      redirect_to returns_path
    else
      @brands = Manufacturer.find(params["return"]["manufacturer_id"]).brands if params["return"]["manufacturer_id"] != ""
      render 'edit'
    end
  end

  def destroy
    @return = Return.find(params[:id])
    @return.destroy
    flash[:notice] = "Return successfully deleted"
    redirect_to returns_path
  end

  def filter
    if params[:manufacturer]
      manufacturer = Manufacturer.find_by(name: params[:manufacturer])
      @returns = Return.where(manufacturer_id: manufacturer.id)
    elsif params[:brand]
      brand = Brand.find_by(name: params[:brand])
      @returns = Return.where(brand_id: brand.id)
    end

    render '_table', layout: false, locals: {returns: @returns, table_class: 'filtered-table'}
  end

  def import
    number_of_returns = 0

    CSV.foreach(params[:file].path, headers: true) do |row|
      return_hash = row.to_hash

      manufacturer = Manufacturer.find_or_create_by(name: return_hash["Manufacturer"])
      brand = Brand.find_or_create_by(name: return_hash["Brand"])

      manufacturer.brands << brand unless manufacturer.brands.exists?(brand.id)

      return_ar = Return.new(
        auth_number: return_hash["RA Number"],
        return_date: Date.strptime(return_hash["RA Date"], '%m-%d-%Y').to_s,
        credit_date: return_hash["CM Date"] && Date.strptime(return_hash["CM Date"], '%m-%d-%Y').to_s,
        credit_memo_number: return_hash["CM Number"],
        brand_id: brand.id,
        manufacturer_id: manufacturer.id,
        frame_count: return_hash["Frame Count"],
        comments: return_hash["Notes"]
      )

      number_of_returns += 1 if return_ar.save
    end

    flash[:notice] = "#{number_of_returns} returns successfully imported"

    redirect_to returns_path
  end

  private

  def return_params
    params.require(:return).permit(:auth_number, :return_date, :credit_date, :credit_memo_number, :brand_id, :manufacturer_id, :frame_count, :comments)
  end
end
