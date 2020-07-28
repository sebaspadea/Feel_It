class Booking < ApplicationRecord
  belongs_to :experience # experience.user == seller
  belongs_to :user # user
  ESTADO = %w(Proximas Completadas Canceladas)
  validates :status, presence: true, inclusion: { in: ESTADO }
  validates :date, presence: true
end
