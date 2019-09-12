# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_locale
  before_action :store_current_location, unless: :devise_controller?
  # before_action :redirect_to_pre_launch_page
  after_action :track_page_view

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def redirect_to_pre_launch_page
    return if current_user.admin?

    redirect_to root_path
  end

  def track_page_view
    properties = request.path_parameters
    properties[:url] = request.url
    ahoy.track 'Page view', properties
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def set_locale
    I18n.locale = :da
  end
end
