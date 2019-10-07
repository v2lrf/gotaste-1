# frozen_string_literal: true

require 'rails_helper'

describe Favorite do
  describe 'the same user can only follow a place once' do
    let(:user) { create :user }
    let(:place) { create :place }
    let!(:favorite) { create :favorite, user: user, place: place }

    it 'returns a validation error' do
      expect { Favorite.create!(user: user, place: place) }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
