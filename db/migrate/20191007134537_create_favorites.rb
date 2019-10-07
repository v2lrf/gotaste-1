# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorites, %i[user_id place_id], unique: true
  end
end
