# frozen_string_literal: true

class PlaceCreator
  def initialize(place:)
    @place = place
  end

  def call
    unless place.save
      return OpenStruct.new(success?: false, place: nil, errors: place.errors)
    end

    add_opening_hours

    OpenStruct.new(success?: true, place: place, errors: nil)
  end

  private

  attr_reader :place

  def add_opening_hours
    Date::DAYNAMES.each_with_index do |_day, index|
      OpeningHour.create(place: place, day_of_week: index)
    end
  end
end
