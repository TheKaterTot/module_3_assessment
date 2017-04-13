class Store
  def initialize(data)
    @data = data
  end

  def name
    @data["name"]
  end

  def city
    @data["city"]
  end

  def phone
    @data["phone"]
  end

  def distance
    @data["distance"]
  end
end
