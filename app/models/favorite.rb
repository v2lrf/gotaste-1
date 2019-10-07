# frozen_string_literal: true

class Favorite < ApplicationRecord
  validates :place_id,
            uniqueness: { scope: :user, message: 'already favorited' }

  belongs_to :user
  belongs_to :place
end
