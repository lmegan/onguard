class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy, :deactivate]
  def index
    @events = Event.where(user: current_user)
  end

  def show

    @user = @event.user
    @event_logs = @event.event_logs
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def create
    @event = Event.new(event_params)
    @user = current_user
    if DateTime.now >= @event.start_date && DateTime.now <= @event.end_date
      @event.active = true
    else
      @event.active = false
    end
    @event.user = @user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def deactivate
    @event.update_attributes(active: false)
    redirect_to event_path(@event)
end

  def destroy

    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :start_time, :end_time, :description, :location, :active, :user_id)
  end
end
