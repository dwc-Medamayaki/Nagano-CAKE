class Public::SearchesController < ApplicationController
  def search
    @genres = Genre.all
    @word = params[:word]
      @items = Item.looks(params[:word])
      @items = @items.page(params[:page])
      render "/public/items/index.html"
  end
  
  
end
