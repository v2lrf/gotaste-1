# frozen_string_literal: true

require 'rails_helper'

describe 'Areas', type: :request do
  let!(:area) { create :area }

  describe 'GET show' do
    it 'is a successful request' do
      get area_path(area.slug)
      expect(response).to be_successful
    end
  end
end
