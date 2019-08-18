class EventsController < ApplicationController
  after_action :ahoy_track, only: :show

  def index; end

  def show
    @event = Event.find_by!(slug: params[:event_slug])
    page_meta[:name] = @event.name
  end

  private

  def ahoy_track
    ahoy.track 'Event view', place: @event.id
  end
end
