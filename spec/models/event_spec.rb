# frozen_string_literal: true

require 'rails_helper'

describe Event do
  describe 'generate_slug' do
    let(:event) { create(:event) }

    it 'returns the date from the begins_at and the name as a slug' do
      expect(event.slug)
        .to eq "#{event.begins_at.to_date}-#{event.name.parameterize}"
    end
  end

  describe '#date' do
    let(:event) { build(:event) }

    it 'returns the date from the begins_at' do
      expect(event.date).to eq event.begins_at.to_date
    end
  end
end
