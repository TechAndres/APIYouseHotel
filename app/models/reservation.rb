class Reservation < ApplicationRecord
  validates :user_name, presence: true
  validates :user_phone, presence: true
  validates :user_email, presence: true
  validates :user_membership, presence: true
  validates :day_in, presence: true
  validates :day_out, presence: true
  validates :room_id, presence: true
  validates :user_name, presence: true

 has_one :room
end
