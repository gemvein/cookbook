# frozen_string_literal: true

# Migration for Recipes, like "Caprese Salad"
class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :serves
      t.string :meal
      t.text :instructions

      t.timestamps
    end
  end
end
