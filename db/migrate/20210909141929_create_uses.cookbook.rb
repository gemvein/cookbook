# frozen_string_literal: true

# Uses acts as a polymorphic joining table with extras for context
# For example, a Recipe might "use" Tools, Supplies, and Ingredients.
class CreateUses < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_uses do |t|
      t.boolean :published, default: true
      t.references :use_in, polymorphic: true, null: false
      t.references :use_of, polymorphic: true, null: false
      t.float :quantity_minimum
      t.float :quantity_maximum
      t.string :unit
      t.integer :sort
      t.string :note
      t.string :preparation

      t.timestamps
    end
  end
end
