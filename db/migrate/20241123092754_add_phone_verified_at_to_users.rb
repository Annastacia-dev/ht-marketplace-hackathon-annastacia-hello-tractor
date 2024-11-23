class AddPhoneVerifiedAtToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :phone_verified_at, :datetime
  end
end
