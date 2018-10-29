require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Reservation, type: :model do

  it "is not valid without a user name" do
      reservation = Reservation.new(user_name: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a user phone" do
      reservation = Reservation.new(user_phone: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a user email" do
      reservation = Reservation.new(user_email: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a user membership" do
      reservation = Reservation.new(user_membership: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a day in" do
      reservation = Reservation.new(day_in: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a day out" do
      reservation = Reservation.new(day_out: nil)
      expect(reservation).to_not be_valid
  end

  it "is not valid without a user phone" do
    reservation = Reservation.new
      reservation.user_name = "carlos"
      reservation.user_phone = "3138400389"
      expect(reservation).to_not be_valid
    end

    it "is valid without a minibar" do
      reservation = Reservation.new
        reservation.user_name = "carlos"
        reservation.user_phone = "3138400389"
        reservation.user_email = "carlos@gmail.com"
        reservation.user_membership = "yes"
        reservation.user_membership = "yes"
        reservation.day_in = DateTime.new(2018,1,1)
        reservation.day_out = DateTime.new(2018,1,2)
        reservation.check = "in"
        reservation.room_id = 5
      expect(reservation).to be_valid
      end

      it "is not valid without a day in" do
        reservation = Reservation.new
          reservation.user_name = "carlos"
          reservation.user_phone = "3138400389"
          reservation.user_email = "carlos@gmail.com"
          reservation.user_membership = "yes"
          reservation.user_membership = "yes"
          reservation.day_out = DateTime.new(2018,1,2)
          reservation.check = "in"
          reservation.room_id = 5
        expect(reservation).to_not be_valid
        end

        it "is not valid without a day out" do
          reservation = Reservation.new
            reservation.user_name = "carlos"
            reservation.user_phone = "3138400389"
            reservation.user_email = "carlos@gmail.com"
            reservation.user_membership = "yes"
            reservation.user_membership = "yes"
            reservation.day_in = DateTime.new(2018,1,1)
            reservation.check = "in"
            reservation.room_id = 5
          expect(reservation).to_not be_valid
          end
end
