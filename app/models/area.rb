# frozen_string_literal: true

class Area < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :parent, class_name: 'Area', optional: true
  has_many :children,
           class_name: 'Area',
           foreign_key: 'parent_id',
           dependent: :restrict_with_exception,
           inverse_of: :parent

  geocoded_by :name

  before_validation :generate_slug
  after_validation :geocode, if: -> { name_changed? } unless Rails.env.test?

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
