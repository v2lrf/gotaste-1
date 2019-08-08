# frozen_string_literal: true

require 'rails_helper'

describe 'Admin place opening hours', type: :request do
  let(:place) { create :place }

  before { sign_in user }

  describe 'GET show' do
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

  describe 'PUT update' do
    context 'when user is an admin' do
      let(:user) { create :user, :admin }
      let!(:opening_hour) { create :opening_hour, place: place }

      it 'it redirects to the show page' do
        put admin_place_opening_hours_path(place.slug),
            params: {
              place: {
                id:                       place.id,
                opening_hours_attributes: {
                  '0' => {
                    opens_at:  'something',
                    closes_at: 'other',
                    id:        opening_hour.id
                  }
                }
              }
            }

        expect(response).to redirect_to admin_place_opening_hours_path(
          place.slug
        )
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        put admin_place_opening_hours_path(place.slug)
        expect(response).to redirect_to root_path
      end
    end
  end
end
