class CreateTractors < ActiveRecord::Migration[7.2]
  def change
    create_table :tractors, id: :uuid do |t|
      t.references :tractor_listing, null: false, foreign_key: true, type: :uuid
      t.string :brand, null: false
      t.string :model, null: false
      t.text :description
      t.integer :condition, null: false
      t.string :year_of_manufacture, null: false
      t.string :hours_used
      t.string :location
      t.string :stock_quantity
      t.string :price
      t.integer :publishing_status, default: 0
      t.integer :selling_status, default: 0

      t.timestamps
    end
  end
end
