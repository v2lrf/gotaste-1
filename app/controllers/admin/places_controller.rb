# frozen_string_literal: true

module Admin
  class PlacesController < BaseController
    before_action :find_place!, only: %w[edit update]

    def index
      @places = policy_scope(Place).order(:name)
    end

    def new
      @place = Place.new
      @place.build_location
    end

    def create
      result = PlaceCreator.new(place: Place.new(place_params)).call

      if result.success?
        redirect_to edit_admin_place_path(result.place)
      else
        render :new, error: result.errors
      end
    end

    def edit
      authorize @place
      page_meta[:name] = @place.name
    end

    def update
      authorize @place

      if @place.update(place_params)
        redirect_to edit_admin_place_path(@place.id)
      else
        render :edit
      end
    end

    private

    def place_params
      params.require(:place).permit(
        :name,
        :category,
        :email,
        :website,
        :phone_number,
        :description,
        :short_description,
        :active,
        :area_id,
        location_attributes: %i[street_name street_number postal_code city]
      )
    end
  end
end
