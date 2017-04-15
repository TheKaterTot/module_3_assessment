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
end
