class KeyPolicyMaker < ActiveRecord::Base
  attr_accessible :reason, :campaign_id, :policy_maker_id
  belongs_to :campaign
  belongs_to :policy_maker
end
