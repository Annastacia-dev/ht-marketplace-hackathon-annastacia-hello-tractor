# == Schema Information
#
# Table name: users
#
#  id                                 :uuid             not null, primary key
#  dealer_type                        :integer          default("tractors"), not null
#  email                              :string           default(""), not null
#  encrypted_password                 :string           default(""), not null
#  location                           :string           not null
#  name                               :string           not null
#  phone                              :string           not null
#  phone_verification_code            :string
#  phone_verification_code_expires_at :datetime
#  phone_verified_at                  :datetime
#  remember_created_at                :datetime
#  reset_password_sent_at             :datetime
#  reset_password_token               :string
#  role                               :integer          default("buyer"), not null
#  seller_verified_at                 :datetime
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
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
  has_many :tractors, through: :tractor_listing, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }, uniqueness: true
  validates :location, presence: true

  enum role: {
    buyer: 0,
    seller: 1,
    admin: 2,
    dealer: 3
  }

  enum dealer_type: {
    tractors: 0,
    implements: 1,
    spare_parts: 2,
    operators: 3,
  }

  after_create :create_tractor_listing

  def create_tractor_listing
    if self.role == 'seller'
      self.create_tractor_listing
    end
  end

  def is_phone_verified?
    return true if self.admin?
    phone_verified_at.present?
  end

  def is_seller_verified?
    seller_verified_at.present?
  end

  private

  def create_tractor_listing
    self.tractor_listing = TractorListing.create(user: self)
  end
end
