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
      if request.xhr?
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        @brand.manufacturers << manufacturer
        @brands = manufacturer.brands
        render 'returns/_brand_select', layout: false
      else
        flash[:notice] = "Brand successfully added"
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
      if request.xhr?
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        @brands = manufacturer.brands
        render '_list', layout: false
      else
        flash[:notice] = "Brand successfully updated"
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
    if request.xhr?
      manufacturer = Manufacturer.find_by(name: params[:manufacturer])

      if @brand.manufacturers.count > 1
        manufacturer.brands.delete(@brand)
        returns = Return.where(brand_id: @brand.id, manufacturer_id: manufacturer.id)
        returns.each { |data| data.destroy }
      else
        returns = Return.where(brand_id: @brand.id)
        returns.each { |data| data.destroy }
        @brand.destroy
      end

      @brands = manufacturer.brands
      render '_list', layout: false
    else
      @brand.destroy
      redirect_to brands_path
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
