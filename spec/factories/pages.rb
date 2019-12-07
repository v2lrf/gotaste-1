# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    sequence(:title) { |n| "Page #{n}" }
    published { true }
  end
end
