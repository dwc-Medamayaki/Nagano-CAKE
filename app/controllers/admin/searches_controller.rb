class Public::SearchesController < ApplicationController
  def search
    @word = params[:word]
      @items = Item.looks(params[:word])
      @items = @items.page(params[:page])
      render "/admin/items/index.html"
  end
  
  
end
