class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :firstname
      t.string :middlename
      t.string :email
      t.string :contact
      t.string :room_type
      t.string :check_in
      t.string :check_out

      t.timestamps
    end
  end
end
