# frozen_string_literal: true

module Places
  class ShopsController < ApplicationController
    def index
      @places = Place.where(active: true).where(category: :shop).order(:name)
    end
  end
end
