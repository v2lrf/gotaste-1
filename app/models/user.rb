# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :first_name, :last_name, presence: true
end
