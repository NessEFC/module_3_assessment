require 'rails_helper'

RSpec.describe "Store" do
  it ".find_nearby_stores(zip)" do
    VCR.use_cassette(".find_nearby_stores(zip)") do

      zip = "80202"

      stores = Store.find_nearby_stores(zip)

      expect(stores).to be_an(Array)
      expect(stores.count).to eq(10)
      expect(Store.total).to eq(16)

      expect(stores.first.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(stores.first.city).to eq("DENVER")
      expect(stores.first.distance).to eq(3.45)
      expect(stores.first.phone).to eq("303-270-9189")
      expect(stores.first.type).to eq("Mobile SAS")

      expect(stores.last.name).to eq("BEST BUY - SOUTHGLENN")
      expect(stores.last.city).to eq("CENTENNIAL")
      expect(stores.last.distance).to eq(11.02)
      expect(stores.last.phone).to eq("303-797-3246")
      expect(stores.last.type).to eq("Big Box")
    end
  end
end
