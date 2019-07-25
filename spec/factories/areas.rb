# frozen_string_literal: true

FactoryBot.define do
  factory :area do
    name { 'København' }
    slug { 'kobenhavn' }
    latitude { 55.67594 }
    longitude { 12.56553 }
  end
end
