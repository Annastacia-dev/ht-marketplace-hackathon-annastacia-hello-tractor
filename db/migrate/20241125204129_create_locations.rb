class CreateLocations < ActiveRecord::Migration[7.2]
  def change
    create_table :locations, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :town
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
