class Admin::GenresController < ApplicationController
  def index
    # @genre= Genre.find(params[:id])
    @genre=Genre.new
    @genres= Genre.all
  end

  def edit
  end
  
  def update
   if @genre.update(genre_params)
      redirect_to admin_genres_path
   else
      redirect_to edit_admin_genre_path(@genre)
   end
  end
  
  def create
    @genre= Genre.new(genre_params)
    @genre.save
    redirect_to request.referer
  end
  
  private
  
  def genre_params
    params.permit(:name)
  end
  
end
