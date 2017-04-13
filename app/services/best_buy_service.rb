class BestBuyService
  def self.get_stores_by_zip(zip)
    response = client("/stores(area(#{zip},25))?format=json&show=storeId,storeType,name,city,distance,phone&apiKey=#{ENV["KEY"]}")
    JSON.parse(response.body)["stores"].map do |store_data|
      Store.new(store_data)
    end
  end

  private
  def client(path)
    Faraday.get("https://api.bestbuy.com/v1" + path)
  end
end
