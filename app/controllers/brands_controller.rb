class BrandsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @brands = Brand.all.order(:name)
  end

  def new
    @brand = Brand.new
    if request.xhr?
      render '_form', layout: false
    end
  end

  def edit
    @brand = Brand.find(params[:id])
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
        @brands = manufacturer.brands
        render 'returns/_brand_select', layout: false
      else
        redirect_to returns_path
      end
    else
      if request.xhr?
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        if @existing_brand = Brand.find_by(name: params["brand"]["name"])
          if @existing_brand.manufacturers.include?(manufacturer)
            render json: @brand.errors, status: :unprocessable_entity
          else
            @existing_brand.manufacturers << manufacturer
            @brands = manufacturer.brands
            render 'returns/_brand_select', layout: false
          end
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      else
        render 'new'
      end
    end
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      flash[:notice] = "Brand successfully updated"
      if request.xhr?
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        @brands = manufacturer.brands
        render '_list', layout: false
      else
        redirect_to brands_path
      end
    else
      if request.xhr?
        render json: @brand.errors, status: :unprocessable_entity
      else
        render 'edit'
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    puts '*****' * 5
    if request.xhr?
      @brands = Brand.all.order(:name)
      render '_list', layout: false
    else
      redirect_to brands_path
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
