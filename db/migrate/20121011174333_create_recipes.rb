class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :ingredient_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
