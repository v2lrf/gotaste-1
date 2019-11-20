# frozen_string_literal: true

module Areas
  class BaseAreaController < ApplicationController
    before_action :find_area

    private

    def find_area
      @area = Area.find_by(slug: params[:area_id])
    end

    def area_ids
      [@area.id] + @area.children.map(&:id)
    end
  end
end
