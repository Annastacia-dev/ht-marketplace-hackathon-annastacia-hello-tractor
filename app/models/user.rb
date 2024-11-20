# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  dealer_type            :integer          default("tractors"), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  location               :string           not null
#  name                   :string           not null
#  phone                  :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_type              :integer          default("buyer"), not null
#  verified_at            :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_paper_trail

  has_one_attached :avatar
  has_one_attached :cover_photo

  has_one :tractor_listing, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }, uniqueness: true
  validates :location, presence: true

  enum user_type: {
    buyer: 0,
    seller: 1,
    admin: 2
  }

  enum dealer_type: {
    tractors: 0,
    spare_parts: 1,
    operators: 2,
  }

  after_create :create_tractor_listing

  def create_tractor_listing
    if self.user_type == 'seller'
      self.create_tractor_listing
    end
  end

  private

  def create_tractor_listing
    self.tractor_listing = TractorListing.create(user: self)
  end
end
