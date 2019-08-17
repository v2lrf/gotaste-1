# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  has_one_attached :cover_image
  has_rich_text :description
  belongs_to :place
  has_one :location, as: :locatable, inverse_of: :locatable, dependent: :destroy

  accepts_nested_attributes_for :location

  before_validation :generate_slug

  def date
    begins_at&.to_date
  end

  private

  def generate_slug
    self.slug = "#{date}-#{name.parameterize}"
  end
end
