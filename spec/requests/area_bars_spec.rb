# frozen_string_literal: true

require 'rails_helper'

describe 'Area bars', type: :request do
  let!(:area) { create :area }

  describe 'GET index' do
    it 'is a successful request' do
      get area_bars_path(area.slug)
      expect(response).to be_successful
    end
  end
end
