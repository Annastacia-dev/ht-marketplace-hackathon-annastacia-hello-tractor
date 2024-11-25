# == Schema Information
#
# Table name: locations
#
#  id         :uuid             not null, primary key
#  address    :string
#  phone      :string
#  town       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_locations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Location < ApplicationRecord
  belongs_to :user
end
