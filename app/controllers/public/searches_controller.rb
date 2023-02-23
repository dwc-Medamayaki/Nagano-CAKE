class Public::SearchesController < ApplicationController
 before_action :set_genre
  
  def search
    @items = Item.looks(params[:word])
    @items = @items.page(params[:page])
      render "/public/items/index.html"
  end
  
  def search_genre
    @is_search = true
    @items = Item.where(genre_id: params[:genre_id])
    @items = @items.page(params[:page])
    @genre = Genre.find(params[:genre_id])
    @search_word = @genre.name
    render "/public/items/index.html"
  end

  private

  def set_genre
   @genres = Genre.all
  end
  
end
