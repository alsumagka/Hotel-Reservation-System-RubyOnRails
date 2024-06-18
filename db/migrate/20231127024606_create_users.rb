class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :email
      t.string :contact
      t.integer :status
      t.string :check_in
      t.string :check_out

      t.timestamps
    end
  end
end
