# frozen_string_literal: true

class OpeningHour < ApplicationRecord
  validates :day_of_week, presence: true

  belongs_to :place

  def day_of_week
    Date::DAYNAMES[self[:day_of_week]]
  end
end
