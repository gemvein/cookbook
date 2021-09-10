# frozen_string_literal: true

# Migration for Supplies, like "Twine"
class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|
      t.string :name
      t.text :description
      t.string :source

      t.timestamps
    end
  end
end
