class Beneficiary < ActiveRecord::Base
  attr_accessible :reason, :campaign_id, :vehicle_id
  belongs_to :campaign
  belongs_to :vehicle
end
