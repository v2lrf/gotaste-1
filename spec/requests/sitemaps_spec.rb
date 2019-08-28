# frozen_string_literal: true

require 'rails_helper'

describe 'Sitemaps', type: :request do
  describe 'GET index' do
    it 'is a successful request' do
      get sitemap_path(format: :xml)
      expect(response).to be_successful
    end
  end
end
