class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
    if request.xhr?
      render '_form', layout: false
    end
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "Manufacturer successfully created"
      redirect_to returns_path
    else
      render 'new'
    end
  end


  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
