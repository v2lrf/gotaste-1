# frozen_string_literal: true

require 'rails_helper'

describe 'Admin places', type: :request do
  # let(:place) { create :place }

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

  describe 'GET new' do
    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get new_admin_place_path
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get new_admin_place_path
        expect(response).to redirect_to root_path
      end
    end
  end
end
