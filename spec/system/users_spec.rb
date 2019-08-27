# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'can go to signup and register' do
    visit root_path

    click_link(t('shared.navbar.sign_in'))
    click_link(t('devise.sessions.new.sign_up'))

    fill_in 'user_first_name', with: attributes_for(:user)[:first_name]
    fill_in 'user_last_name', with: attributes_for(:user)[:last_name]
    fill_in 'user_email', with: attributes_for(:user)[:email]
    fill_in 'user_password', with: attributes_for(:user)[:password]
    click_button(t('devise.registrations.new.submit'))

    expect(page).to have_text(t('shared.navbar.sign_out'))
  end
end
