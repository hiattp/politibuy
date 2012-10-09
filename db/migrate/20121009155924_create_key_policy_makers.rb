class CreateKeyPolicyMakers < ActiveRecord::Migration
  def change
    create_table :key_policy_makers do |t|
      t.references :campaign
      t.references :policy_maker
      t.string :reason
      
      t.timestamps
    end
  end
end
