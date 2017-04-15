require "rails_helper"

describe Store do
  let(:store) { Store.new({"name" => "hello",
                           "city" => "williams",
                           "distance" => 3.0,
                           "phone" => "1234567890",
                           "store_type" => "box"}
               )}
  describe "#name" do
    it "returns the store name" do
      expect(store.name).to eq("hello")
    end
  end
end
