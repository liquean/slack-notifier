class CreateInventoryEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_entries do |t|
      t.references :store, null: false, foreign_key: true
      t.references :model, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
