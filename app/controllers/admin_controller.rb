class AdminController < ApplicationController

  def reset
    flash[:notice] = "Password reset instructions have been sent to your email."
    Admin.first.send_reset_password_instructions
    redirect_to new_admin_session_path
  end


end
