# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @places = Place.where(active: true)
    @events = Event.upcoming.order(:begins_at)
  end
end
