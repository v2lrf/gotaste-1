# frozen_string_literal: true

require 'rails_helper'

describe 'Pre launch', :site_inactive, type: :system do
  scenario 'Users go to front page and is presented with the pre launch page' do
    visit root_path

    expect(page).to have_text(t('home.pre_launch.header'))
  end

  scenario 'Users can go to login page' do
    visit new_user_session_path

    expect(page).to have_text(t('devise.sessions.new.header'))
  end

  scenario "Users will be redirected if they go to 'places'" do
    visit places_path

    expect(page).to have_text(t('home.pre_launch.header'))
  end
end
