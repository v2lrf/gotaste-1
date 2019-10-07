# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_place

  def create
    current_user.favorites.create(place: @place)
    ahoy.track 'Favorite place', place: @place.id, user: current_user.id

    redirect_to place_path(@place.slug)
  end

  def destroy
    current_user.favorites.find_by(place: @place).destroy
    ahoy.track 'Unfavorite place', place: @place.id, user: current_user.id

    redirect_to place_path(@place.slug)
  end

  private

  def find_place
    @place = Place.find_by!(slug: params[:place_id])
  end
end
