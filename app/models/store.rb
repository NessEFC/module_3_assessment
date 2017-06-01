class Store

  def self.find_nearby_stores(zip)
    raw_stores = BestBuyService.find_nearby_stores(zip)
  end

end
