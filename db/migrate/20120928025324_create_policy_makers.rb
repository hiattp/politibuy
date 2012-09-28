class CreatePolicyMakers < ActiveRecord::Migration
  def change
    create_table :policy_makers do |t|
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :party
      t.string :home_state
      t.attachment :profile_image
      t.timestamps
    end
  end
end
