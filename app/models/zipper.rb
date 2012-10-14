class Zipper
  
  require 'net/http'
  
  def self.get_city_and_state(zipcode)
    url = URI.parse('http://ZiptasticAPI.com/'+zipcode)
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    res.body
  end
  
end
