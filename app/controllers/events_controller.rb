class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.where(user: current_user)
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.user
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    # if @event.save
    #   redirect_to event_path(@event)
    # else
    #   redirect_to
    # end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :start_time, :end_time, :description, :location, :active, :user_id)
  end
end
