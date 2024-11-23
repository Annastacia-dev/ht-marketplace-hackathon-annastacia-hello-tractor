class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.string :subject
      t.text :message
      t.string :link
      t.string :link_text
      t.integer :status, default: 0
      t.boolean :email, default: false
      t.boolean :in_app, default: false
      t.boolean :push, default: false

      t.timestamps
    end
  end
end
