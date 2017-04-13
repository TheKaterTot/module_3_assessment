class BestBuyService

  def self.get_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},10))?format=json&show=storeId,storeType,name,city,distance,phone&apiKey=#{ENV["KEY"]}")
    JSON.parse(response.body)["stores"].map do |store_data|
      Store.new(store_data)
    end
  end
end
