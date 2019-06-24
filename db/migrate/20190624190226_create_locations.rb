# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.references :locatable, polymorphic: true, null: false
      t.string :street_name, null: false
      t.string :street_number, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false

      t.timestamps
    end
  end
end
