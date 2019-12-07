# frozen_string_literal: true

require 'rails_helper'

describe Page do
  describe 'slug generation' do
    let!(:page) { create :page, title: 'København' }

    it "generates a slug from the page's title" do
      expect(page.slug).to eq 'kobenhavn'
    end
  end
end
