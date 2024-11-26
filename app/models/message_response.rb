# == Schema Information
#
# Table name: message_responses
#
#  id         :uuid             not null, primary key
#  content    :text
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_message_responses_on_message_id  (message_id)
#  index_message_responses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
class MessageResponse < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
