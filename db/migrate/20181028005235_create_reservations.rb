class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer "room_id"
      t.string "user_name"
      t.string "user_phone"
      t.string "user_email"
      t.string "user_membership"
      t.date "day_in"
      t.date "day_out"
      t.string "minibar", default: 'no'
      t.string "check", default: 'in'
      t.timestamps
    end
  end
end
