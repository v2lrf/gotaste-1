# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    user
    association :reviewable, factory: :place
    rating { 5 }
  end
end
