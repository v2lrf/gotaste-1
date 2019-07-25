# frozen_string_literal: true

require 'rails_helper'

describe 'Admin places', type: :request do
  before { sign_in user }

  describe 'GET index' do
    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get admin_places_path
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get admin_places_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET edit' do
    let(:place) { create :place }

    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get edit_admin_place_path(place.slug)
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get edit_admin_place_path(place.slug)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PATCH update' do
    let(:place) { create :place }
    let(:valid_params) { { place: { name: 'New name' } } }

    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'redirects to the edit page' do
        patch admin_place_path(place.slug), params: valid_params
        expect(response).to redirect_to edit_admin_place_path(place.slug)
      end

      it 'updates the place' do
        patch admin_place_path(place.slug), params: valid_params
        expect(Place.find_by(slug: place.slug).name).to eq 'New name'
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        patch admin_place_path(place.slug), params: valid_params
        expect(response).to redirect_to root_path
      end
    end
  end
end
