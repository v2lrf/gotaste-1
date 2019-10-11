# frozen_string_literal: true

class AddFavoritesCounterCacheToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :favorites_count, :integer, default: 0, null: false
  end
end
