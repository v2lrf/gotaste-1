# frozen_string_literal: true

require 'rails_helper'

describe Area do
  describe 'slug generation' do
    context "when area doesn't have a parent" do
      let!(:area) { create :area, name: 'København' }

      it "generates a slug from the area's name" do
        expect(area.slug).to eq 'kobenhavn'
      end
    end

    context 'when area has a parent' do
      let(:parent) { create :area, name: 'København' }
      let!(:area) { create :area, name: 'Nørrebro', parent: parent }

      it "generates a slug that includes the parent's slug" do
        expect(area.slug).to eq 'kobenhavn-norrebro'
      end
    end
  end
end
