# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :first_name, :last_name, presence: true

  has_many :favorites, dependent: :destroy

  def flipper_id
    self.class.name + id.to_s
  end
end
