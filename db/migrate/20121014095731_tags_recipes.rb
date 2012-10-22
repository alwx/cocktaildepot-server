class TagsRecipes < ActiveRecord::Migration
  def up
    drop_table :tags_recipes
    create_table :tags_recipes, :id => false do |t|
      t.integer :tag_id
      t.integer :recipe_id
    end
  end

  def down
    drop_table :tags_recipes
  end
end
