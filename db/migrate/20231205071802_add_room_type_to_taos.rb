class AddRoomTypeToTaos < ActiveRecord::Migration[7.0]
  def change
    add_column :taos, :room_type, :string
  end
end
