# frozen_string_literal: true

class Review < ApplicationRecord
  validates :rating,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 5
            }
  validates :user_id, uniqueness: { scope: %i[reviewable_type reviewable_id] }

  belongs_to :user
  belongs_to :reviewable, polymorphic: true
end
