class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :recipes, :slug, unique: true
  end
end
