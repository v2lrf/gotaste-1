# frozen_string_literal: true

class Lead < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
