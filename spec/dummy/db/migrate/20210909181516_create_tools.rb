# frozen_string_literal: true

# Migration for Tools, like "Skillet"
class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.string :composition

      t.timestamps
    end
  end
end
