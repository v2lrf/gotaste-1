# frozen_string_literal: true

require 'rails_helper'

describe OpeningHour do
  describe '#day_of_week' do
    let(:opening_hour) { create :opening_hour }

    it 'returns the day name' do
      expect(opening_hour.day_of_week).to eq 'Sunday'
    end
  end
end
