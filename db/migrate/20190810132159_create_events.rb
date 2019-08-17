# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.references :place, null: false, foreign_key: true
      t.datetime :begins_at, null: false
      t.datetime :ends_at
      t.string :short_description
      t.string :url
      t.decimal :price, precision: 8, scale: 2, default: '0.0', null: false

      t.timestamps
    end
  end
end
