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
      redirect_to returns_path
    else
      render 'new'
    end
  end


  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
