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

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @brands = @manufacturer.brands

    if request.xhr?
      render 'brands/_list', layout: false
    end
  end

  def new
    @manufacturer = Manufacturer.new
    if request.xhr?
      render '_form', layout: false
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
    if request.xhr?
      render '_form', layout: false
    end
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      if request.xhr?
        render 'returns/_manufacturer_select', layout: false
      else
        flash[:notice] = "Manufacturer successfully added"
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
      if request.xhr?
        @manufacturers = Manufacturer.all.order(:name)
        render '_list', layout: false
      else
        flash[:notice] = "Manufacturer successfully updated"
        redirect_to manufacturers_path
      end
    else
      if request.xhr?
        render json: @manufacturer.errors, status: :unprocessable_entity
      else
        render 'edit'
      end
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    brands = @manufacturer.brands
    brands.first.destroy if brands.count == 1

    @manufacturer.destroy
    if request.xhr?
      @manufacturers = Manufacturer.all.order(:name)
      render '_list', layout: false
    else
      redirect_to manufacturers_path
    end
  end


  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
