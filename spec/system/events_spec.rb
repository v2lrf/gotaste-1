# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :system do
  let!(:future_event) { create :event }

  scenario 'Users go from front page, to events, to an event' do
    visit root_path

    within('nav') { click_link(t('shared.navbar.events')) }
    click_link(future_event.slug)

    expect(current_path).to eq(event_path(future_event.slug))
  end

  scenario 'Users can click "find tickets" button and it opens a new window' do
    visit event_path(future_event.slug)

    new_window = window_opened_by { click_link t('events.show.find_ticket') }

    within_window new_window do
      expect(current_url).to eq('http://example.com/')
    end
  end
end
