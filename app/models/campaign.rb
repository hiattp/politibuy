class Campaign < ActiveRecord::Base
  has_many :updates
  has_many :recipients
  has_many :policy_makers, :through => :recipients
  
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
