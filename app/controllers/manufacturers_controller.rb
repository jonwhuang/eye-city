class ManufacturersController < ApplicationController
  before_action :authenticate_admin!

  def collection
    manufacturer = Manufacturer.find_by(name: params[:name])
    @brands = manufacturer.brands
    render 'returns/_brand_select', layout: false
  end

  def index
    @manufacturers = Manufacturer.all.order(:name)
  end

  def new
    @manufacturer = Manufacturer.new
    if request.xhr?
      render '_form', layout: false
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "Manufacturer successfully added"
      if request.xhr?
        render 'returns/_manufacturer_select', layout: false
      else
        redirect_to returns_path
      end
    else
      if request.xhr?
        render json: @manufacturer.errors, status: :unprocessable_entity
      else
        render 'new'
      end
    end
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer.update(manufacturer_params)
      flash[:notice] = "Manufacturer successfully updated"
      redirect_to manufacturers_path
    else
      render 'edit'
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path
  end


  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
