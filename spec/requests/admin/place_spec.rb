# frozen_string_literal: true

require 'rails_helper'

describe 'Admin home', type: :request do
  let(:user) { create :user, :admin }

  before { sign_in user }

  describe 'GET index' do
    it 'is a successful request' do
      get admin_places_path
      expect(response).to be_successful
    end
  end
end
