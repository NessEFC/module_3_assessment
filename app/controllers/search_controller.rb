class SearchController < ApplicationController

  def index
    @stores = Store.find_nearby_stores(params[:search_box])
  end

end
