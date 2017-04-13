require "rails_helper"

describe BestBuyService do
  let(:zip) { "80204" }

  describe "get_stores_by_zip" do
    it "returns an array of stores by distance from zip" do
      VCR.use_cassette("services/best_buy") do
        stores = BestBuyService.get_stores_by_zip(zip)
        store = stores.first

        expect(stores.count).to eq(7)
        expect(store.name).to eq("BELMAR CO")
      end
    end
  end
end
