# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :area, null: false, foreign_key: true
      t.integer :category, null: false
      t.string :website
      t.string :email
      t.string :phone_number
      t.text :description
      t.string :short_description

      t.timestamps

      t.index %w[slug], name: 'index_places_on_slug', unique: true
    end
  end
end
