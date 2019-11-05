# frozen_string_literal: true

class CreateCrawledEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :crawled_events do |t|
      t.references :place, null: false, foreign_key: true
      t.string :url
      t.string :name
      t.string :date
      t.string :time
      t.string :link
      t.string :image_url
      t.string :where
      t.string :location
      t.text :description
      t.text :source

      t.timestamps
    end
  end
end
