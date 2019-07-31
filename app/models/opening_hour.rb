# frozen_string_literal: true

class OpeningHour < ApplicationRecord
  validates :day_of_week, presence: true

  belongs_to :place

  # Order by day_of_week: Monday, tuesday, wednesday, thursdag, friday, etc..
  default_scope do
    order(
      Arel.sql(
        'CASE day_of_week WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3
        WHEN 4 THEN 4 WHEN 5 THEN 5 WHEN 6 THEN 6 WHEN 0 THEN 7 END'
      )
    )
  end

  def day_of_week
    Date::DAYNAMES[self[:day_of_week]]
  end
end
