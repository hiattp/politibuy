class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.string :objective
      t.datetime :deadline
      t.boolean :live, :default => false
      t.attachment :main_image
      t.timestamps
    end
  end
end
