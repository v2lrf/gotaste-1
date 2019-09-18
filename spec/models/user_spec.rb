# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#flipper_id' do
    let(:user) { build_stubbed :user }

    it 'returns the flipper_id for the user' do
      expect(user.flipper_id).to eq "User#{user.id}"
    end
  end
end
