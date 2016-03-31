class ReturnsController < ApplicationController

  def index
    if !current_admin
      redirect_to new_admin_session_path
    end
    @returns = Return.all
    @outstanding = Return.where(credit_memo_number: "")
  end

  def show
    @return = Return.find(params[:id])
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

  private

  def return_params
    params.require(:return).permit(:auth_number, :return_date, :credit_date, :credit_memo_number, :brand_id, :manufacturer_id, :frame_count, :comments)
  end
end
