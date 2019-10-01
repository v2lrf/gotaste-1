# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    sequence(:name) { |n| "Wine place #{n}" }

    category { :shop }
    area

    after(:create) { |place| create(:location, locatable: place) }
  end
end
