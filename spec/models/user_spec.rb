# == Schema Information
#
# Table name: users
#
#  id                                 :uuid             not null, primary key
#  dealer_type                        :integer          default("tractors"), not null
#  email                              :string           default(""), not null
#  encrypted_password                 :string           default(""), not null
#  location                           :string           not null
#  name                               :string           not null
#  phone                              :string           not null
#  phone_verification_code            :string
#  phone_verification_code_expires_at :datetime
#  phone_verified_at                  :datetime
#  remember_created_at                :datetime
#  reset_password_sent_at             :datetime
#  reset_password_token               :string
#  role                               :integer          default("buyer"), not null
#  seller_verified_at                 :datetime
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
