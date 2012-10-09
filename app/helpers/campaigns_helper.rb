module CampaignsHelper
  
  def total_pledged(pledges)
    pledges.reduce(0) do |sum, p|
      sum + p.amount
    end
  end
  
end
