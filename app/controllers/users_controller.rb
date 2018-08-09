class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
  end
   def complete_profile
    @user = current_user
    @user.phone_number = params[:user][:phone_number]
    @user.save
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
  end
end
