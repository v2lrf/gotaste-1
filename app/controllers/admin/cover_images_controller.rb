# frozen_string_literal: true

module Admin
  class CoverImagesController < BaseController
    before_action :find_place!, only: %w[show update]

    def show; end

    def update
      if @place.update(update_params)
        redirect_to admin_place_cover_image_path(@place.slug)
      else
        render :show
      end
    end

    private

    def update_params
      params.require(:place).permit(:cover_image)
    end
  end
end
