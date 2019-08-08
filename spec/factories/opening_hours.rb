# frozen_string_literal: true

FactoryBot.define do
  factory :opening_hour do
    place
    day_of_week { 0 }
    opens_at { '2019-07-28 08:57:28' }
    closes_at { '2019-07-28 08:57:28' }
  end
end
