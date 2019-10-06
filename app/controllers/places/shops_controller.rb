# frozen_string_literal: true

module Places
  class ShopsController < ApplicationController
    def index
      @places = Place.where(active: true).shops.order(:name)
    end
  end
end
