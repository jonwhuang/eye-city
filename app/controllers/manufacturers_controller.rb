class ManufacturersController < ApplicationController
  before_action :authenticate_admin!

  def collection
    manufacturer = Manufacturer.find_by(name: params[:name])
    @brands = manufacturer.brands
    render 'returns/_brand_select', layout: false
  end

  def new
    @manufacturer = Manufacturer.new
    if request.xhr?
      render '_form', layout: false
    end
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


  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
