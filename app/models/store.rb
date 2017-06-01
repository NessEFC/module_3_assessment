class Store

  attr_reader :name, :city, :distance, :phone, :type, :total

  def initialize(attrs={})
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.find_nearby_stores(zip)
    @raw_stores = BestBuyService.find_nearby_stores(zip)
    parse_stores(@raw_stores)
  end

  def self.parse_stores(stores)
    store_instances = stores[:stores]
    store_instances.map { |store| Store.new(store) }
  end

  def self.total
    @raw_stores[:total]
  end

end
