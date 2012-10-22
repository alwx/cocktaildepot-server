class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :recipes, :ingredient_id
    remove_column :recipes, :tag_id
  end

  def down
  end
end
