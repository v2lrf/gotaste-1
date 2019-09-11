# frozen_string_literal: true

FactoryBot.define do
  factory :lead do
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end
