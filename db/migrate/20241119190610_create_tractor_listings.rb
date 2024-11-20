class CreateTractorListings < ActiveRecord::Migration[7.2]
  def change
    create_table :tractor_listings, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
