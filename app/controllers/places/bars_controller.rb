# frozen_string_literal: true

module Places
  class BarsController < ApplicationController
    def index
      @places = Place.where(active: true).where(category: :bar).order(:name)
    end
  end
end
