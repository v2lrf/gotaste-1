# frozen_string_literal: true

class PlacesController < ApplicationController
  def index; end

  def show
    @place = Place.find_by!(slug: params[:id])
    page_meta[:name] = @place.name
  end
end
