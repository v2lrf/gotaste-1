# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Navigation', type: :system do
  let!(:place) { create :place, active: true }

  context 'when user is logged in' do
    scenario 'user can favorite a place' do
      visit root_path
      login_user
      favorite_place

      expect(place.favorites.count).to eq 1
    end

    scenario 'user can unfavorite a place' do
      visit root_path
      login_user
      favorite_place

      click_link("unfavorite-#{place.slug}")

      expect(place.favorites.count).to eq 0
    end
  end

  context 'when not logged in' do
    scenario 'user are sent to login when favoriting a place' do
      visit root_path
      favorite_place

      expect(current_path).to eq(new_user_session_path)
    end
  end

  private

  def login_user
    user = create(:user)

    click_link(t('shared.navbar.sign_in'))

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: attributes_for(:user)[:password]

    click_button(t('devise.sessions.new.submit'))
  end

  def favorite_place
    click_link(place.slug)
    click_link("favorite-#{place.slug}")
  end
end
