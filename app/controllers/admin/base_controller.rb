# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!

    layout 'admin'

    def authenticate_admin!
      redirect_to root_path unless current_user&.admin?
    end
  end
end
