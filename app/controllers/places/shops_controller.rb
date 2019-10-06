# frozen_string_literal: true

module Places
  class ShopsController < ApplicationController
    def index
      @places = Place.active.shops.order(:name)
    end
  end
end
