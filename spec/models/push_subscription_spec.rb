# == Schema Information
#
# Table name: push_subscriptions
#
#  id         :uuid             not null, primary key
#  endpoint   :string
#  keys       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_push_subscriptions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe PushSubscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
