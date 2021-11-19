class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :description, presence: true, length: { minimum: 110 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :price, presence: true, length: { maximum: 10 }
  validates :name, presence: true
  validates :location, presence: true
  validates :availability, presence: true
  validates :photo, presence: true
end
