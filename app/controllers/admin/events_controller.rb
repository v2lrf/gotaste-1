# frozen_string_literal: true

module Admin
  class EventsController < BaseController
    before_action :find_place!

    def index
      @events = @place.events
    end

    def new
      @event = @place.events.new
    end

    def create
      @event = @place.events.new(event_params)

      if @event.save
        redirect_to edit_admin_place_event_path(@place, @event)
      else
        render :new
      end
    end

    def edit
      @event = @place.events.find(params[:id])
      page_meta[:name] = @event.name
    end

    def update
      @event = @place.events.find(params[:id])

      if @event.update(event_params)
        redirect_to edit_admin_place_event_path(@place, @event)
      else
        render :edit
      end
    end

    private

    def event_params
      params.require(:event).permit(
        :name,
        :begins_at,
        :ends_at,
        :url,
        :price,
        :short_description,
        :description,
        :cover_image
      )
    end
  end
end
