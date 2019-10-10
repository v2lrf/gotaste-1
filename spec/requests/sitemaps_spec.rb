# frozen_string_literal: true

require 'rails_helper'

describe 'Sitemaps', type: :request do
  before do
    create :place, category: :bar, active: true
    create :place, category: :shop, active: true
    create :event
  end

  describe 'GET index' do
    it 'is a successful request' do
      get sitemap_path(format: :xml)
      expect(response).to be_successful
    end
  end
end
