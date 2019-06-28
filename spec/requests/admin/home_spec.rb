# frozen_string_literal: true

require 'rails_helper'

describe 'Admin home', type: :request do
  context 'when not logged in' do
    it 'user is redirected the home page' do
      get admin_root_path
      expect(response).to redirect_to root_path
    end
  end

  context 'when logged in as a user' do
    let(:user) { create :user }

    before { sign_in user }

    it 'user is redirected the home page' do
      get admin_root_path
      expect(response).to redirect_to root_path
    end
  end

  context 'when logged in as an admin' do
    let(:user) { create :user, :admin }

    before { sign_in user }

    it 'is a successful request' do
      get admin_root_path
      expect(response).to be_successful
    end
  end
end
