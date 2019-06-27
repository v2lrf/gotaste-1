# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlacePolicy, type: :policy do
  let(:user) { User.new }

  subject(:policy) { described_class }

  permissions '.scope' do
  end

  permissions :index?, :show? do
    it 'grants access' do
      expect(policy).to permit(user, Place.new)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    context 'when user is admin' do
      let(:user) { User.new(role: :admin) }

      it 'grants access' do
        expect(policy).to permit(user, Place.new)
      end
    end

    context 'when regular user' do
      let(:user) { User.new }

      it 'denies permits access' do
        expect(policy).not_to permit(user, Place.new)
      end
    end
  end
end
