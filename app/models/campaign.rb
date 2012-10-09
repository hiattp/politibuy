class Campaign < ActiveRecord::Base
  has_many :updates
  
  has_many :key_policy_makers
  has_many :policy_makers, :through => :key_policy_makers
  
  has_many :pledges
  has_many :users, :through => :pledges
  
  # beneficiaries are the PACS or other vehicles that recieve the pledge proceeds
  has_many :beneficiaries
  has_many :vehicles, :through => :beneficiaries
  
  attr_accessible :title, :description, :objective, :deadline, :live, :main_image
    
  has_attached_file :main_image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :path => "campaigns/:attachment/:id/:style.:extension"
  
end
