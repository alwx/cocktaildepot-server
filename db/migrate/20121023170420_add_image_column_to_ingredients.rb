class AddImageColumnToIngredients < ActiveRecord::Migration
  def change
    add_attachment :ingredients, :image
  end
end
