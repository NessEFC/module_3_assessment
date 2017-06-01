class Store

  def self.find_nearby_stores(zip)
    BestBuyService.find_nearby_stores(zip)
  end

end
