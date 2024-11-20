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
require 'rails_helper'

RSpec.describe TractorListing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
