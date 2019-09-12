# frozen_string_literal: true

class LeadsController < ApplicationController
  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      ahoy.track 'Lead create success', lead: @lead.id
      redirect_to root_path(message: 'thanks')
    else
      ahoy.track 'Lead create failure', errors: @lead.errors.full_messages
      redirect_to root_path(message: 'error')
    end
  end

  private

  def lead_params
    params.permit(:email)
  end
end
