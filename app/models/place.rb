# frozen_string_literal: true

class Place < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  enum category: { shop: 0, bar: 1, restaurant: 2 }

  belongs_to :area
end
