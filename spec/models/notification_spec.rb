# == Schema Information
#
# Table name: notifications
#
#  id         :uuid             not null, primary key
#  email      :boolean          default(FALSE)
#  in_app     :boolean          default(FALSE)
#  link       :string
#  link_text  :string
#  message    :text
#  push       :boolean          default(FALSE)
#  status     :integer          default("unread")
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_notifications_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
