class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :middlename
      t.string :lastname

      t.timestamps
    end
  end
end
