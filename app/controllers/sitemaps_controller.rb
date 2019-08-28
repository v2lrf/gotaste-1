# frozen_string_literal: true

class SitemapsController < ApplicationController
  def index
    @host = "#{request.protocol}#{request.host}"
    @places = Place.where(active: true)
    @events = Event.order(:begins_at)
  end
end
