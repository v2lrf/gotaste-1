# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    sequence :name do |n|
      "Wine shop #{n}"
    end

    sequence :slug do |n|
      "wine-shop#{n}"
    end

    category { :shop }
    area
  end
end
