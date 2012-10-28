class AddIsMainToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :is_main, :boolean
  end
end
