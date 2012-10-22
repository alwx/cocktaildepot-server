class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
