module CampaignsHelper
  
  def ensure_http(url)
    if url.include? "http"
      url
    else
      "http://"+url
    end
  end
  
end
