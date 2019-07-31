# frozen_string_literal: true

require 'rails_helper'

describe 'Admin place opening hours', type: :request do
  before { sign_in user }

  describe 'GET show' do
    let(:place) { create :place }

    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get admin_place_opening_hours_path(place.slug)
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get admin_place_opening_hours_path(place.slug)
        expect(response).to redirect_to root_path
      end
    end
  end
end
