class EventsController < ApplicationController
  before_action :current_user
  def index
    @events = Event.all
    @events_past = Event.previously
    @events_previous = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash.notice = 'Event created'
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
