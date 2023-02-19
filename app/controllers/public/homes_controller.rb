class Public::HomesController < ApplicationController
  def top
    @new_item = Item.order('id DESC').limit(4)
    @genres = Genre.all
  end

  def about
  end
end
