class CreateMessageResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :message_responses, id: :uuid do |t|
      t.references :message, null: false, foreign_key: true, type: :uuid
      t.text :content
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
