class Admin::GenresController < ApplicationController
  def index
    # @genre= Genre.find(params[:id])
    @genre=Genre.new
    @genres= Genre.all
  end

  def edit
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
