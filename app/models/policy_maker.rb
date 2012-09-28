class PolicyMaker < ActiveRecord::Base
  attr_accessible :bio, :first_name, :home_state, :last_name, :party, :salutation, :profile_image
  
  has_many :recipients
  has_many :campaigns, :through => :recipients
  
  has_attached_file :profile_image,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "policy_makers/:attachment/:id/:style.:extension"
    
end
