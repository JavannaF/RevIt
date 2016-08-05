class StaticPagesController < ApplicationController
  def home
    @item = current_user.items.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) if logged_in?
  end

  def help
  end
end
