class RemoveColumRoomid < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :room_id
  end
end
