require 'rails_helper'

RSpec.describe "Item API" do
  it "Displays all items" do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success
    expect(Item.count).to eq(3)
  end
end
