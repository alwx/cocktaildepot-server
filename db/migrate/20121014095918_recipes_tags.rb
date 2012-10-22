class RecipesTags < ActiveRecord::Migration
  def up
    drop_table :tags_recipes
    create_table :recipes_tags, :id => false do |t|
      t.integer :tag_id
      t.integer :recipe_id
    end
  end

  def down
    drop_table :recipes_tags
  end
end
