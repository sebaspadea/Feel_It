class Booking < ApplicationRecord
  belongs_to :experience # experience.user == seller
  belongs_to :user # user
  ESTADO = %w(Proxima Completada Cancelada)
  validates :status, presence: true, inclusion: { in: ESTADO }
  validates :date, presence: true
end
