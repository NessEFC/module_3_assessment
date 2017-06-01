require 'rails_helper'

RSpec.describe "BestBuyService" do
  it "finds the nearest stores and displays first 10 based on zipcode" do
    VCR.use_cassette(".find_nearby_stores(zip)") do

      zip = "80202"

      raw_stores = BestBuyService.find_nearby_stores(zip)

      expect(raw_stores).to be_a(Hash)
      expect(raw_stores[:total]).to be_an(Integer)
      expect(raw_stores[:stores]).to be_an(Array)
      expect(raw_stores[:stores].count).to eq(10)
      expect(raw_stores[:stores].first).to be_a(Hash)
      expect(raw_stores[:stores].last).to be_a(Hash)
    end
  end
end
