# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :redirect_to_pre_launch_page
  before_action :configure_permitted_parameters

  def create
    super

    UsersMailer.welcome(user: resource).deliver_later if resource.save
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
