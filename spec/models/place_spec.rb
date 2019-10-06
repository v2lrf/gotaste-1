# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Place do
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
