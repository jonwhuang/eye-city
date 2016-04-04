class ReturnsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def index
    redirect_to new_admin_session_path if !current_admin
    @manufacturers = Manufacturer.all.order(:name)
    @brands = Brand.all.order(:name)
    @returns = Return.all.order(:return_date)
    @outstanding = Return.where("credit_memo_number = '' OR credit_memo_number IS NULL").order(:return_date)
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
  end

  def create
    @return = Return.new(return_params)

    if @return.save
      flash[:notice] = "Return successfully created"
      redirect_to returns_path
    else
      render 'new'
    end
  end

  def update
    @return = Return.find(params[:id])

    if @return.update(return_params)
      flash[:notice] = "Return successfully updated"
      redirect_to returns_path
    else
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
      render '_table', layout: false, locals: {returns: @returns}
    elsif params[:brand]
      brand = Brand.find_by(name: params[:brand])
      @returns = Return.where(brand_id: brand.id)
      render '_table', layout: false, locals: {returns: @returns}
    end
  end

  private

  def return_params
    params.require(:return).permit(:auth_number, :return_date, :credit_date, :credit_memo_number, :brand_id, :manufacturer_id, :frame_count, :comments)
  end
end
