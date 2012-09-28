class Campaign < ActiveRecord::Base
  has_many :updates
  has_many :recipients
  has_many :policy_makers, :through => :recipients
  
  attr_accessible :title, :description, :objective, :deadline, :live, :main_image
    
  has_attached_file :main_image,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "campaigns/:attachment/:id/:style.:extension"
  
end
