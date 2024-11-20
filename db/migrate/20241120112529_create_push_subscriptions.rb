class CreatePushSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :push_subscriptions, id: :uuid do |t|
      t.string :endpoint
      t.jsonb :keys
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
