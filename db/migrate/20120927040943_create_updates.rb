class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :campaign
      t.date :published_date
      t.string :title
      t.string :preview
      t.string :reference_url
      t.timestamps
    end
  end
end
