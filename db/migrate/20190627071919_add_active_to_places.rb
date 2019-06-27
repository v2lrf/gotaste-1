# frozen_string_literal: true

class AddActiveToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :active, :boolean, null: false, default: false
  end
end
