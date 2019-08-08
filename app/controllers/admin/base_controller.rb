# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!
    skip_before_action :track_ahoy_visit
    skip_after_action :track_page_view

    layout 'admin'

    def authenticate_admin!
      redirect_to root_path unless current_user&.admin?
    end

    protected

    def find_place_by_slug!
      @place = Place.find_by!(slug: params[:id] || params[:place_id])
    end
  end
end
