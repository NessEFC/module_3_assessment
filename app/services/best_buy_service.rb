class BestBuyService

  def initialize(zip)
    @_conn = Faraday.new("https://api.bestbuy.com")
    @zip = zip
  end

  def self.find_nearby_stores(zip)
    service = BestBuyService.new(zip)
    service.find_nearby_stores
  end

  def find_nearby_stores
    response = conn.get("/v1/stores(area(#{@zip},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BEST_BUY_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def conn
      @_conn
    end

end
