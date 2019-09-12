# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_locale
  # before_action :redirect_to_pre_launch_page
  after_action :track_page_view

  protected

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

  def set_locale
    I18n.locale = :da
  end
end
