require 'rails_helper'

RSpec.describe "Item API" do
  it "Displays all items" do
    create_list(:item, 3)

    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "Displays a single item" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/#{id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
  end

  it "Deletes an item" do
    item = create(:item)
    id = item.id
    name = item.name

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_success
    expect(Item.count).to eq(0)
  end

  it "Creates an item" do
    item = create(:item)
    id = item.id
    name = item.name

    expect(Item.count).to eq(1)

    item_params = { name: "Computer", description: "Good computer.", image_url: "url" }

    post "/api/v1/items", { item: item_params }

    new_item = Item.last

    expect(response).to be_success
    expect(Item.count).to eq(2)
    expect(new_item.name).to eq("Computer")
    expect(new_item.description).to eq("Good computer.")
    expect(new_item.image_url).to eq("url")
  end
end
