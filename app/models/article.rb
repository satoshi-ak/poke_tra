class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :country, presence: true
  validates :address, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
