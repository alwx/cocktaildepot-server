class CreateTagsRecipes < ActiveRecord::Migration
  def up
    create_table :tags_recipes, :id => false do |t|
      t.integer :rag_id
      t.integer :recipe_id
    end
  end

  def down
    drop_table :tags_recipes
  end
end
