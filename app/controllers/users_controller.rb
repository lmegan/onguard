class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @events = current_user.events
    @event = Event.new
    @user = current_user
  end

  def complete_profile
    @user = current_user
    @user.phone_number = params[:user][:phone_number]
    @user.save
    redirect_to dashboard_path
  end

  def panic_button
    account_sid = 'AC520aebb72ea41ef9497bc18c58428fe8'
    auth_token = 'b4e31df5314f1d6ff3f7d57a29d79b79'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                             body: 'Hello there!',
                             from: 'whatsapp:+441618507453',
                             to: 'whatsapp:+18033671560'
                           )
    redirect_to dashboard_path, notice: "Your emergency contacts have been notified."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
  end
end
