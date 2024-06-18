class AddLastnameToHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :histories, :lastname, :string
  end
end
