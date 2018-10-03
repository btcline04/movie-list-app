class MoviesController < ApplicationController
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      flash[:danger] = "Please try again!"
      redirect_to new_movie_path
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :poster, :runtime, :director, :plot, :list_id)
  end
end
