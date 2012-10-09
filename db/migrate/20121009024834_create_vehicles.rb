class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :description
      t.string :info_link
      t.attachment :logo_image

      t.timestamps
    end
  end
end
