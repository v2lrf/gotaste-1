# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :render_pre_launch

  def index
    @places = Place.active
    @events = Event.upcoming.order(:begins_at)
  end

  private

  def render_pre_launch
    return if feature_enabled?(:site_active)

    render 'pre_launch', layout: 'pre_launch'
  end
end
