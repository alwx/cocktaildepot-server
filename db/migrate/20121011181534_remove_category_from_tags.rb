class RemoveCategoryFromTags < ActiveRecord::Migration
  def up
    remove_column :tags, :category_id
  end

  def down
  end
end
