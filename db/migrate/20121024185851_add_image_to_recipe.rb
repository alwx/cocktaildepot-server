class AddImageToRecipe < ActiveRecord::Migration
  def change
    add_attachment :recipes, :image
    remove_column :recipes, :photo
  end
end
