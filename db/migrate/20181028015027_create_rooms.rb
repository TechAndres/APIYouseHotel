class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer "room_number"
      t.float "daily_rate"
      t.boolean "available", default: false
      t.timestamps
    end
  end
end
