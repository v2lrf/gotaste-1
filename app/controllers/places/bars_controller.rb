# frozen_string_literal: true

module Places
  class BarsController < ApplicationController
    def index
      @places = Place.active.bars.order(:name)
    end
  end
end
