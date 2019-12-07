# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, index: { unique: true }, null: false
      t.string :description
      t.boolean :published, null: false, default: false
      t.integer :parent_id, index: true

      t.timestamps
    end
  end
end
