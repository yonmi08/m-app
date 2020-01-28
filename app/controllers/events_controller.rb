class EventsController < ApplicationController
  def new
    @event = Event.includes(:user)
    # render :json => @event
    respond_to do |format|
      format.json {
        render json:
        @event.to_json(
          only: [:title, :start, :end, :color]
        )
      }
    end
  end
end
