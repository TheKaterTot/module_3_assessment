class BestBuyService
  def initialize
  end
  def self.get_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,name,city,distance,phone&apiKey=#{ENV["KEY"]}")
    JSON.parse(response.body)["stores"]
  end
end
