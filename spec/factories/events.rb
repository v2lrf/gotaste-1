# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence :name do |n|
      "Blindtasting #{n}"
    end

    place
    begins_at { Time.current + 1.day }
    ends_at { Time.current + 1.day + 2.hours }
    short_description { 'MyText' }
    url { 'http://example.com' }
    price { 9.99 }

    after(:create) { |event| create(:location, locatable: event) }
  end
end
