# frozen_string_literal: true

require 'rails_helper'

describe PlaceCreator do
  let(:place) { build :place }

  subject(:service) { described_class.new(place: place) }

  describe '#call' do
    context 'when place is valid' do
      it 'saves the place' do
        expect { service.call }.to change { Place.count }.by(1)
      end

      it 'adds opening hours' do
        service.call
        expect(place.opening_hours.count).to eq 7
      end

      it 'returns success true' do
        expect(service.call.success?).to be true
      end
    end

    context 'when place is invalid' do
      let(:place) { build :place, name: '' }
      let(:result) { service.call }

      it 'returns the error' do
        expect(result.errors).not_to be_nil
      end

      it 'returns success false' do
        expect(result.success?).to be false
      end
    end
  end
end
