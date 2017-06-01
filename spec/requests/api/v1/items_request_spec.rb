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
end
