# frozen_string_literal: true

# Migration for Ingredients, like "Mushrooms"
class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :aisle
      t.string :store
      t.string :cost

      t.timestamps
    end
  end
end
