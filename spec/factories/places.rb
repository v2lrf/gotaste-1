# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    sequence :name do |n|
      "Wine shop #{n}"
    end

    category { :shop }
    area

    after(:create) do |place|
      create(:location, locatable: place)
    end
  end
end
