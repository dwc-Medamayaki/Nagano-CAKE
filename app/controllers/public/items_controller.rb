class Public::ItemsController < ApplicationController
 before_action :set_genre
  
  def index
    @items = Item.page(params[:page]).per(8)
    @is_search = false
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def set_genre
   @genres = Genre.all
  end
  
end
