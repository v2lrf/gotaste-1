# frozen_string_literal: true

class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :email, index: { unique: true }

      t.timestamps
    end
  end
end
