# == Schema Information
#
# Table name: tractors
#
#  id                  :uuid             not null, primary key
#  brand               :string           not null
#  condition           :integer          not null
#  description         :text
#  hours_used          :string
#  location            :string
#  model               :string           not null
#  price               :string
#  publishing_status   :integer          default("draft")
#  selling_status      :integer          default("for_sale")
#  stock_quantity      :string
#  year_of_manufacture :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  tractor_listing_id  :uuid             not null
#
# Indexes
#
#  index_tractors_on_tractor_listing_id  (tractor_listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (tractor_listing_id => tractor_listings.id)
#
require 'rails_helper'

RSpec.describe Tractor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
