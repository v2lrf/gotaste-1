# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Places', type: :system do
  let!(:place_1) { create :place, name: 'Shop1', active: true, category: :shop }
  let!(:place_2) { create :place, name: 'Shop2', active: true, category: :shop }
  let!(:place_3) { create :place, name: 'Bar1', active: true, category: :bar }

  scenario 'Users go from front page, to places, to a place' do
    visit root_path

    within('nav') { click_link(t('shared.navbar.places')) }

    expect(page).to have_text(t('places.index.header'))
    click_link(place_1.slug)

    expect(current_path).to eq(place_path(place_1.slug))
  end

  scenario 'Users can filter places by category' do
    visit places_path
    expect(page).to have_text(t('places.index.header'))

    click_link(t('places.filtering.bars'))
    expect(page).to have_text(t('places.bars.index.header'))

    click_link(t('places.filtering.shops'))
    expect(page).to have_text(t('places.shops.index.header'))
  end
end
