# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Place do
  describe '.bars' do
    let!(:active_place) { create :place, active: true }
    let!(:inactive_place) { create :place, active: false }

    it 'only returns active places' do
      expect(Place.active).to include active_place
      expect(Place.active).not_to include inactive_place
    end
  end

  describe '.bars' do
    let!(:bar) { create :place, category: :bar }
    let!(:shop) { create :place, category: :shop }

    it 'only returns bars' do
      expect(Place.bars).to include bar
      expect(Place.bars).not_to include shop
    end
  end

  describe '.shops' do
    let!(:bar) { create :place, category: :bar }
    let!(:shop) { create :place, category: :shop }

    it 'only returns shops' do
      expect(Place.shops).to include shop
      expect(Place.shops).not_to include bar
    end
  end
end
