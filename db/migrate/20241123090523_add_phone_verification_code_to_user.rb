class AddPhoneVerificationCodeToUser < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :verified_at, :seller_verified_at
    add_column :users, :phone_verification_code, :string
    add_column :users, :phone_verification_code_expires_at, :datetime
  end
end
