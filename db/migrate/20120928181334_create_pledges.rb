class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user
      t.references :campaign
      
      t.float :amount
      t.boolean :matching, :default => false
      t.boolean :anonymous, :default => false
      
      t.timestamps
    end
  end
end
