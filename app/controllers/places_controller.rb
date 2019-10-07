# frozen_string_literal: true

class PlacesController < ApplicationController
  after_action :ahoy_track, only: :show

  def index
    @places = Place.active.order(:name)
  end

  def show
    @place = Place.find_by!(slug: params[:id])
    page_meta[:name] = @place.name

    render :show,
           locals: {
             cover_image: @place.cover_image,
             number_of_favorites: @place.favorites.count,
             place: @place,
             user_has_favorited_place:
               current_user&.favorites&.where(place: @place)&.exists?
           }
  end

  private

  def ahoy_track
    ahoy.track 'Place view', place: @place.id
  end
end
