class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
    @is_search = false
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
  
end
