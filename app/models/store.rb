class Store
  attr_reader :name,
              :city,
              :phone,
              :distance,
              :store_type

  def initialize(data)
    @data = data
    @name = @data["name"]
    @city = @data["city"]
    @phone = @data["phone"]
    @distance = @data["distance"]
    @store_type = @data["storeType"]
  end

  def self.get_stores_by_zip(zip)
    BestBuyService.get_stores_by_zip(zip).map do |data|
      Store.new(data)
    end
  end
end
