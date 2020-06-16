# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new.build
  end

  def create
    @event = Event.new.build(event_params)
    @event.save

    redirect_to event_path(@event)
  end

  private

  def article_params
    params.require(:event).permit(:description)
    end
end
