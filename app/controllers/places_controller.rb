# frozen_string_literal: true

class PlacesController < ApplicationController
  after_action :ahoy_track, only: :show

  def index
    @places = Place.active.order(:name)
  end

  def show
    @place = Place.find_by!(slug: params[:id])
    page_meta[:name] = @place.name

    render component: 'Place', props: { place: place_object }, prerender: false

    # render :show,
    #        locals: {
    #          cover_image: @place.cover_image,
    #          number_of_favorites: @place.favorites.size,
    #          place: @place,
    #          user_has_favorited_place:
    #            current_user&.favorites&.where(place: @place)&.exists?
    #        }
  end

  private

  def ahoy_track
    ahoy.track 'Place view', place: @place.id
  end

  def place_object
    {
      images: [
        @place.cover_image.key,
        @place.cover_image.key,
        @place.cover_image.key,
        @place.cover_image.key
      ],
      name: @place.name,
      category: t(@place.category, scope: 'place_categories'),
      latitude: @place.location.latitude.to_f,
      longitude: @place.location.longitude.to_f,
      address_1:
        t(
          'shared.location.address_first_part',
          street_name: @place.location.street_name,
          street_number: @place.location.street_number
        ),
      address_2:
        t(
          'shared.location.address_second_part',
          postal_code: @place.location.postal_code, city: @place.location.city
        ),
      phone_number: @place.phone_number,
      description: @place.description.body,
      area: @place.area.name
    }
  end
end
