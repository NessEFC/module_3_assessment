require 'rails_helper'

RSpec.describe "Store" do
  it ".find_nearby_stores(zip)" do
    VCR.use_cassette(".find_nearby_stores(zip)") do

      zip = "80202"

      stores = Store.find_nearby_stores(zip)

      expect(stores).to be_an(Array)
      expect(stores.count).to eq(10)
      expect(stores.total).to eq(16)

      expect(store.first.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(store.first.city).to eq("DENVER")
      expect(store.first.distance).to eq("3.45")
      expect(store.first.phone).to eq("303-270-9189")
      expect(store.first.type).to eq("Mobile SAS")

      expect(store.last.name).to eq("BEST BUY - SOUTHGLENN")
      expect(store.last.city).to eq("CENTENNIAL")
      expect(store.last.distance).to eq("11.02")
      expect(store.last.phone).to eq("303-797-3246")
      expect(store.lat.type).to eq("Big Box")
    end
  end
end
