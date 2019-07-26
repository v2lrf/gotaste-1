# frozen_string_literal: true

class PlacesController < ApplicationController
  after_action :ahoy_track, only: :show

  def index; end

  def show
    @place = Place.find_by!(slug: params[:id])
    page_meta[:name] = @place.name
  end

  private

  def ahoy_track
    ahoy.track 'Place view', place: @place.id
  end
end
