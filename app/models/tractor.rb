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
#  publishing_status   :integer
#  selling_status      :integer
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
class Tractor < ApplicationRecord
  has_paper_trail

  has_many_attached :images

  belongs_to :tractor_listing
  has_one :user, through: :tractor_listing

  validates :brand, presence: true
  validates :model, presence: true
  validates :year_of_manufacture, presence: true

  enum condition: {
    new_machine: 0,
    used: 1,
    refurbished: 2,
    damaged: 3,
    other: 4
  }

  enum publishing_status: {
    draft: 0,
    published: 1,
    archived: 2
  }

  enum selling_status: {
    for_sale: 0,
    sold: 1
  }
end
