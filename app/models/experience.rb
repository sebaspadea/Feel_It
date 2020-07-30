class Experience < ApplicationRecord
  belongs_to :user # seller
  has_many :bookings
  has_many :users, through: :bookings # users
  has_many :reviews

  CATEGORY = %w(Gastronomia Deportes Entretenimiento Cultura)

  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :price, presence: true
  validates :availability, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :place, presence: true
  has_one_attached :photo
  geocoded_by :place
  after_validation :geocode, if: :will_save_change_to_place?
end
