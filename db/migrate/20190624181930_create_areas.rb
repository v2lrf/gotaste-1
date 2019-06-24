# frozen_string_literal: true

class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :parent_id
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps

      t.index %w[slug], name: 'index_areas_on_slug', unique: true
      t.index %w[parent_id], name: 'index_areas_on_parent_id'
    end
  end
end
