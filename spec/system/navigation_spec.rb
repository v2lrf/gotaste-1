# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Navigation', type: :system do
  it 'renders the sign in link' do
    visit places_path
    expect(page).to have_text(t('shared.navbar.sign_in'))
  end

  it 'renders the terms and conditions link' do
    visit places_path
    expect(page).to have_text(t('shared.footer.terms'))
  end
end
