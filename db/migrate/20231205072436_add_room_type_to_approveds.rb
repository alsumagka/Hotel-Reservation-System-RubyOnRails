class AddRoomTypeToApproveds < ActiveRecord::Migration[7.0]
  def change
    add_column :approveds, :room_type, :string
  end
end
