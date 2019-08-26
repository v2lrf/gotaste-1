# frozen_string_literal: true

require 'rails_helper'

describe 'Events', type: :request do
  describe 'GET index' do
    it 'is a successful request' do
      get events_path
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    let(:event) { create :event }

    it 'is a successful request' do
      get event_path(event.slug)
      expect(response).to be_successful
    end
  end
end
