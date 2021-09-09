# frozen_string_literal: true

# Migration for Ingredients, like "Mushrooms"
class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :aisle
      t.string :store
      t.string :cost

      t.timestamps
    end
    add_index :ingredients, :slug, unique: true
  end
end
