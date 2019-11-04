# frozen_string_literal: true

require 'rails_helper'

describe 'API: Crawled events api', type: :request do
  let!(:place) { create :place }

  describe 'POST create' do
    let(:request) do
      post api_crawled_events_path,
           params: {
             crawled_event: {
               name: 'test',
               place_id: place.id,
               url: 'https://someurl.com',
               link: 'https://linktobuytickets.com',
               where: 'The place that hosts the event',
               location: '1 Address, 2200',
               description: 'Here is a long description',
               source: 'The source code of the HTML page.'
             }
           }
    end

    it 'is a successful request' do
      request
      expect(response).to be_successful
    end

    it 'is creates a new crawled event from the params' do
      expect { request }.to change { CrawledEvent.count }.by(1)
    end
  end
end
