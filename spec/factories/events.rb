# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'Blindtasting' }
    place
    begins_at { Time.current + 1.day }
    ends_at { Time.current + 1.day + 2.hours }
    short_description { 'MyText' }
    url { 'MyString' }
    price { 9.99 }
  end
end
