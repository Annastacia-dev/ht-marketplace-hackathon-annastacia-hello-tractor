class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :receiver, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :item, polymorphic: true, null: true
      t.text :content
      t.integer :status, default: '0'
      t.datetime :send_at

      t.timestamps
    end
  end
end
