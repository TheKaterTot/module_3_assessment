require "rails_helper"

describe Search do
  describe ".clean_url" do
    let(:empty_param) {"http://localhost:3000/search"}
    let(:query_param) {"http://localhost:3000/search?utf8=✓&search=55432"}

    it "should remove the query params" do
       query_param.clean_url
       expect(query_param).to eq(empty_param)
    end
  end

end
