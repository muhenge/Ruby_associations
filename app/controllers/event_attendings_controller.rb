class EventAttendingsController < ApplicationController
  before_action :current_user
  def index
    @events = Event.all
  end

  def attend
    eventAttend = EventAttending.new
    @event = Event.find(params["format"])
    eventAttend =  current_user.event_attending.build
    eventAttend.event =  @event
    if !EventAttending.where(user_id: current_user.id, event_id: @event.id).first
      eventAttend.save
      flash.notice = "Attended successfuly the event #{@event.description}"
      redirect_to event_attendings_index_path
    else
      flash.notice = "The event #{@event.description} is already Attended by you "
      redirect_to event_attendings_index_path
    end

  end
end
