class BbService
  def initialize
    @token = ENV["KEY"]
  end

  def get_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80204,10))?format=json&show=storeId,storeType,name,city,distance&apiKey=#{@token}")
    body = JSON.parse(response.body)
    body["stores"].map do |store_data|
      Store.new(store_data)
    end
  end
end
