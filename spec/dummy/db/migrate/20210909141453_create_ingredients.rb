class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :ingredients, :slug, unique: true
  end
end
