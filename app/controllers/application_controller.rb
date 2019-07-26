# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_locale
  after_action :track_page_view

  protected

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
