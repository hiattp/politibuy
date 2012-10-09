class PolicyMaker < ActiveRecord::Base
  attr_accessible :bio, :first_name, :home_state, :last_name, :party, :salutation, :profile_image, :vehicle
  
  has_many :key_policy_makers
  has_many :campaigns, :through => :key_policy_makers
  
  has_attached_file :profile_image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :path => "policy_makers/:attachment/:id/:style.:extension"
    
end
