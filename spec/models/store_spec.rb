require "rails_helper"

describe Store do
  let(:attrs) { {"name" => "hello",
                 "city" => "williams",
                 "distance" => 3.0,
                 "phone" => "1234567890",
                 "storeType" => "box"}
             }

  let(:store) { Store.new(attrs) }

  describe "#name" do
    it "returns the store name" do
      expect(store.name).to eq("hello")
    end
  end

  describe "#phone" do
    it "returns the store phone" do
      expect(store.phone).to eq("1234567890")
    end
  end

  describe "#city" do
    it "returns the store city" do
      expect(store.city).to eq("williams")
    end
  end

  describe "#distance" do
    it "returns the distance from the zip" do
      expect(store.distance).to eq(3.0)
    end
  end

  describe "#store_type" do
    it "returns the type of store" do
      expect(store.store_type).to eq("box")
    end
  end

  describe ".get_stores_by_zip" do
    it "returns all stores by zip" do
      expect(BestBuyService).to receive(:get_stores_by_zip)
        .with("80204")
        .and_return([attrs])

      Store.get_stores_by_zip("80204")
    end
  end
end
