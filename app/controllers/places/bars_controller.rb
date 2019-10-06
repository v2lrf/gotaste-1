# frozen_string_literal: true

module Places
  class BarsController < ApplicationController
    def index
      @places = Place.where(active: true).bars.order(:name)
    end
  end
end
