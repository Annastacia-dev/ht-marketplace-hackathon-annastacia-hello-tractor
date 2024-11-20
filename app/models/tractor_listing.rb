# == Schema Information
#
# Table name: tractor_listings
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_tractor_listings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class TractorListing < ApplicationRecord
  belongs_to :user

  has_many :tractors, dependent: :destroy
end
