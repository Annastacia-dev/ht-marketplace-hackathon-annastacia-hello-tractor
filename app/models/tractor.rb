# == Schema Information
#
# Table name: tractors
#
#  id                  :uuid             not null, primary key
#  condition           :integer          not null
#  description         :text
#  hours_used          :string
#  location            :string
#  make                :string           not null
#  model               :string           not null
#  price               :string
#  publishing_status   :integer          default("ready_for_approval")
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
class Tractor < ApplicationRecord
  has_paper_trail

  has_many_attached :images

  belongs_to :tractor_listing
  has_one :user, through: :tractor_listing, dependent: :destroy

  validates :make, presence: true
  validates :model, presence: true
  validates :year_of_manufacture, presence: true

  enum condition: {
    fairly_used: 0,
    refurbished: 1,
    damaged: 2,
    other: 3
  }

  enum publishing_status: {
    ready_for_approval: 0,
    draft: 1,
    approved: 2,
    rejected: 3,
    archived: 4
  }

  enum selling_status: {
    for_sale: 0,
    sold: 1
  }

  include PgSearch::Model

  pg_search_scope :search_by_make_and_model,
  against: [:make, :model],
  using: {
    tsearch: { prefix: true },
    trigram: { threshold: 0.2 }
  }

  def name
    "#{make} #{model}"
  end

  def tractor_location
    location || user.location
  end
end
