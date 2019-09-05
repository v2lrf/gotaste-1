# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true, null: false
      t.integer :rating, null: false
      t.string :content

      t.timestamps
    end

    add_index :reviews, %i[user_id reviewable_id reviewable_type]
  end
end
