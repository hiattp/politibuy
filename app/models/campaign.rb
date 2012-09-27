class Campaign < ActiveRecord::Base
  attr_accessible :title, :description, :objective, :deadline, :live

  
end
