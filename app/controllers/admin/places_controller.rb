# frozen_string_literal: true

module Admin
  class PlacesController < BaseController
    before_action :find_place_by_slug!, only: %w[edit update]

    def index
      @places = policy_scope(Place)
    end

    def edit
      authorize @place
      page_meta[:name] = @place.name
    end

    def update
      authorize @place

      if @place.update(update_params)
        redirect_to edit_admin_place_path(@place.slug)
      else
        render :edit
      end
    end

    private

    def update_params
      params.require(:place).permit(:name)
    end

    def find_place_by_slug!
      @place = Place.find_by!(slug: params[:id])
    end
  end
end
