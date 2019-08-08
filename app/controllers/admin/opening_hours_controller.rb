# frozen_string_literal: true

module Admin
  class OpeningHoursController < BaseController
    before_action :find_place_by_slug!, only: %w[show update]

    def show; end

    def update
      if @place.update!(update_params)
        redirect_to admin_place_opening_hours_path(@place.slug)
      else
        render :show
      end
    end

    private

    def update_params
      params.require(:place).permit(
        :id,
        opening_hours_attributes: %i[id opens_at closes_at]
      )
    end
  end
end
