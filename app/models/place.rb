# frozen_string_literal: true

class Place < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  enum category: { shop: 0, bar: 1, restaurant: 2 }

  has_rich_text :description
  belongs_to :area
  has_one :location, as: :locatable, inverse_of: :locatable, dependent: :destroy

  accepts_nested_attributes_for :location
end
