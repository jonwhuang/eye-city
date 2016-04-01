class BrandsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @brand = Brand.new
    if request.xhr?
      render '_form', layout: false
    end
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      flash[:notice] = "Brand successfully added"

      if request.xhr?
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        @brand.manufacturers << manufacturer
        render 'returns/_brand_select', layout: false
      else
        redirect_to returns_path
      end
    else
      if request.xhr?
        if @brand = Brand.find_by(name: params["brand"]["name"])
          manufacturer = Manufacturer.find_by(name: params[:manufacturer])
          @brand.manufacturers << manufacturer
          render 'returns/_brand_select', layout: false
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      else
        render 'new'
      end
    end
  end


  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
