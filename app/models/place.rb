# frozen_string_literal: true

class Place < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  enum category: { shop: 0, bar: 1, restaurant: 2 }

  has_one_attached :cover_image
  has_rich_text :description
  belongs_to :area
  has_one :location, as: :locatable, inverse_of: :locatable, dependent: :destroy
  has_many :opening_hours, dependent: :destroy
  has_many :events, dependent: :nullify

  accepts_nested_attributes_for :location, :opening_hours
end
