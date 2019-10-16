# frozen_string_literal: true

require 'rails_helper'

describe 'Admin areas', type: :request do
  before { sign_in user }

  describe 'GET index' do
    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get admin_areas_path
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get admin_areas_path
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET edit' do
    let(:area) { create :area }

    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'is a successful request' do
        get edit_admin_area_path(area)
        expect(response).to be_successful
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        get edit_admin_area_path(area)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PATCH update' do
    let(:area) { create :area }
    let(:valid_params) { { area: { name: 'New name' } } }

    context 'when user is an admin' do
      let(:user) { create :user, :admin }

      it 'redirects to the edit page' do
        patch admin_area_path(area.id), params: valid_params
        expect(response).to redirect_to edit_admin_area_path(area.id)
      end

      it 'updates the area' do
        patch admin_area_path(area.id), params: valid_params
        expect(Area.find(area.id).name).to eq 'New name'
      end
    end

    context 'when user is not an admin' do
      let(:user) { create :user }

      it 'redirects to root' do
        patch admin_area_path(area), params: valid_params
        expect(response).to redirect_to root_path
      end
    end
  end
end
