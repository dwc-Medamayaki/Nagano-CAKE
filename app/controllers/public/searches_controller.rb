class Public::SearchesController < ApplicationController
  def search
    @genres = Genre.all
    @items = Item.looks(params[:word])
    @items = @items.page(params[:page])
      render "/public/items/index.html"
  end
  
  def search_genre
    @genres = Genre.all
    @is_search = true
    @items = Item.where(genre_id: params[:genre_id])
    @items = @items.page(params[:page])
    @genre = Genre.find(params[:genre_id])
    @search_word = @genre.name
    render "/public/items/index.html"
  end
  
end
