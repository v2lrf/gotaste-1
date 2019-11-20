# frozen_string_literal: true

module Areas
  class BarsController < BaseAreaController
    def index
      page_meta[:page_title] = page_title

      render locals: { page_title: page_title, places: places }
    end

    private

    def places
      Place.where(area_id: area_ids).bars.active
    end

    def page_title
      t(
        "#{@area.slug}.bars",
        scope: 'areas.headers', default: t('areas.headers.defaults.bars')
      )
    end
  end
end
