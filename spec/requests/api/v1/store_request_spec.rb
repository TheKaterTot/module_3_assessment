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

describe "get show" do
  it "should be a success" do
    item = Fabricate(:item)

    get "api/v1/items/#{item.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["name"]).to eq("Item")
    expect(item["description"]).to eq("So good")
    expect(item["image_url"]).to eq("None")
  end
end

describe "delete item" do
  it "should be a success" do
    item = Fabricate(:item)

    delete "api/v1/items/#{item.id}"

    expect(response.status).to eq(204)
  end
end

describe "create item" do
  it "should be a success" do
    post "api/v1/items", item: { name: "Fancy Pants",
                                 description: "Fancy",
                                 image_url: "NO"}
                                 
    expect(response.status).to eq(201)

    item = JSON.parse(response.body)
    expect(item["name"]).to eq("Fancy Pants")
  end
end
