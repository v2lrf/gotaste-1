# frozen_string_literal: true

module Areas
  class ShopsController < BaseAreaController
    def index
      page_meta[:page_title] = page_title

      render locals: { page_title: page_title, places: places }
    end

    private

    def places
      Place.where(area_id: area_ids).shops.active
    end

    def page_title
      t(
        "#{@area.slug}.shops",
        scope: 'areas.headers', default: t('areas.headers.defaults.shops')
      )
    end
  end
end
