# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @places = Place.where(active: true)
  end
end
