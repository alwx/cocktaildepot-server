class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.string :name
      t.text :description
    end
  end
end
