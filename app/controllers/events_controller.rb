class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :edit, :update, :destroy, :deactivate]
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
    @start_date = DateTime.parse("#{params[:start_date]} #{params[:start_time]}")
    @end_date = DateTime.parse("#{params[:end_date]} #{params[:end_time]}")
    @event.start_date = @start_date
    @event.end_date = @end_date
    @user = current_user
    if DateTime.now >= @event.start_date && DateTime.now <= @event.end_date
      @event.active = true
    else
      @event.active = false
    end
    @event.user = @user
    if @event.save
      redirect_to dashboard_path
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
    @event = Event.find_by_slug(params[:slug])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :active, :user_id)
  end
end
