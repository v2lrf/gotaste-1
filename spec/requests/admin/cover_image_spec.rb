# frozen_string_literal: true

require 'rails_helper'

describe 'Admin place hero image', type: :request do
  let(:place) { create :place }

  before { sign_in user }

  describe 'GET show' do
    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get admin_place_cover_image_path(place.id)
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get admin_place_cover_image_path(place.id)
        expect(response).to redirect_to root_path
      end
    end
  end
end
