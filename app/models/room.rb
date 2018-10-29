class Room < ApplicationRecord
  scope :available, -> { where(available: true) }
  has_one :reservation
end
