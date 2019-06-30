# frozen_string_literal: true

module Admin
  class PlacesController < BaseController
    def index
      @places = policy_scope(Place)
    end
  end
end
