class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_line_one, :string
    add_column :users, :address_line_two, :string
    add_column :users, :zip_code, :string
  end
end
