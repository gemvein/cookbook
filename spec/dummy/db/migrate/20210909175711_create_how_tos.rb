# frozen_string_literal: true

# Migration for HowTos, like "How to build a dog house"
class CreateHowTos < ActiveRecord::Migration[6.1]
  def change
    create_table :how_tos do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :instructions

      t.timestamps
    end
    add_index :how_tos, :slug, unique: true
  end
end
