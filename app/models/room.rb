class Room < ApplicationRecord
  scope :available, -> { where(available: true) }

end
