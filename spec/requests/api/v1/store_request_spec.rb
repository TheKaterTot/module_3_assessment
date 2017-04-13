require "rails_helper"

describe "get index" do
  it "should be a success" do
    Fabricate(:item)
    Fabricate(:item, name: "No")

    get "api/v1/items"

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items.first["name"]).to eq("Item")
    expect(items.last["name"]).to eq("No")
  end
end
