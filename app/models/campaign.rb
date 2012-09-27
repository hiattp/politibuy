class Campaign < ActiveRecord::Base
  has_many :updates
  
  attr_accessible :title, :description, :objective, :deadline, :live
  
end
