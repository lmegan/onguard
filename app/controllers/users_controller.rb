class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @events = current_user.events
    @event = Event.new
    @user = current_user
  end
end
