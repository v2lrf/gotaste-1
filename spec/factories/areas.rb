# frozen_string_literal: true

FactoryBot.define do
  factory :area do
    sequence(:name) { |n| "København #{n}" }
    latitude { 55.67594 }
    longitude { 12.56553 }
  end
end
