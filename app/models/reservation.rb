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

 def final_price
   @membership = 0
   if self.user_membership == "yes"
     @membership = 0.20
  end
   { final_price: "9",
     temp: self.id,
     minibar: self.minibar,
     membership1: @membership
  }
 end
end
