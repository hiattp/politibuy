class Vehicle < ActiveRecord::Base
  attr_accessible :description, :info_link, :name, :logo_image
  
  has_many :beneficiaries
  has_many :campaigns, :through => :beneficiaries
  
  has_attached_file :logo_image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :s3_protocol => "https",
    :path => "vehicles/:attachment/:id/:style.:extension"
  
  
end
