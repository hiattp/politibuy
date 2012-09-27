class Update < ActiveRecord::Base
  belongs_to :campaign
  attr_accessible :title, :published_date, :preview, :reference_url
end
