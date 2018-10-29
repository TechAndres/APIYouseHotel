class Reservation < ApplicationRecord
  validates :user_name, presence: true
  validates :user_phone, presence: true
  validates :user_email, presence: true
  validates :user_membership, presence: true
  validates :day_in, presence: true
  validates :day_out, presence: true
  validates_uniqueness_of :room_id, presence: true
  validates :user_name, presence: true
  has_one :reservation

 def final_price
   @membership = 0
   @days=(self.day_out - self.day_in).to_i
   @price = 0
   if self.user_membership == "yes"
     @membership = 0.20
     @price =10*@membership*@days
   else
     @price =10*@days
  end

   { final_price: @days,
     temp: self.id,
     check: self.check,
     minibar: self.minibar,
     membership: self.user_membership,
     room: self.room_id

  }

 end
end
