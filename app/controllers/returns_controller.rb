class ReturnsController < ApplicationController

  def home
    if !current_admin
      redirect_to new_admin_session_path
    end
  end

  def new
    @return = Return.new
  end

  def create
    @return = Return.new(return_params)

    if @return.save
      flash[:notice] = "Return successfully created"
      redirect_to home_path
    else
      render 'new'
    end
  end




  private

  def return_params
    params.require(:return).permit(:auth_number, :return_date, :paid_date, :credit_memo_number, :brand_id, :manufacturer_id, :frame_count, :comments)
  end
end
