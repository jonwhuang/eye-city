class ReturnsController < ApplicationController

  def home
    if !current_admin
      redirect_to new_admin_session_path
    end
  end

  def new
    @return = Return.new
  end
end
