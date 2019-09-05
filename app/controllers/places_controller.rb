# frozen_string_literal: true

class PlacesController < ApplicationController
  after_action :ahoy_track, only: :show

  def index; end

  def show
    @place = Place.find_by!(slug: params[:place_slug])
    @review = current_user.reviews.where(reviewable: @place).first_or_initialize
    page_meta[:name] = @place.name
  end

  private

  def ahoy_track
    ahoy.track 'Place view', place: @place.id
  end
end
