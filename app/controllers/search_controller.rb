class SearchController < ApplicationController

  def index
  #store all the projects that match the name searched
  @item_search = Item.search(params[:name], params[:avg_rating], params[:min_price], params[:max_price]).all
  #store all the clients that match the name searched    
  #@clients = Client.where("name LIKE ? ", "%#{params[:client]}%")
  end

end


 