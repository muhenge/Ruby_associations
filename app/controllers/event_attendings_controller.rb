class EventAttendingsController < ApplicationController
  before_action :current_user
  def index
    @events = Event.all
  end

  def attend
    @event = Event.find(params['format'])
    event_attend = current_user.event_attending.build
    event_attend.event = @event
    if !EventAttending.where(user_id: current_user.id, event_id: @event.id).first
      event_attend.save
      flash.notice = "Attended successfuly the event #{@event.description}"
    else
      flash.notice = "The event #{@event.description} is already Attended by you "
    end
    redirect_to event_attendings_index_path
  end
end
