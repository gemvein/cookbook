# frozen_string_literal: true

# Migration for Supplies, like "Twine"
class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :source

      t.timestamps
    end
    add_index :supplies, :slug, unique: true
  end
end
