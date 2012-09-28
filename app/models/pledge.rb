class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  
  attr_accessible :amount, :anonymous, :matching, :campaign_id, :user_id
end
