# frozen_string_literal: true

module Areas
  class EventsController < BaseAreaController
    before_action :find_area

    def index
      @bars = Place.where(area_id: area_ids).bars.active

      page_meta[:page_title] = page_title
    end

    private

    def page_title
      t(
        "#{@area.slug}.events",
        scope: 'areas.headers', default: t('areas.headers.defaults.events')
      )
    end
  end
end
