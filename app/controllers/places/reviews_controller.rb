# frozen_string_literal: true

module Places
  class ReviewsController < ApplicationController
    before_action :find_place!

    def create
      current_user.reviews.create(review_params.merge(reviewable: @place))
    end

    private

    def review_params
      params.require(:review).permit(:rating, :content)
    end

    def find_place!
      @place = Place.find_by!(slug: params[:place_place_slug])
    end
  end
end
