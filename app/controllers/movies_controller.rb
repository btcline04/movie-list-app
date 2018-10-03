class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    binding.pry
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
    params.require(:movie).permit(:title, :year, :genre, :poster, :director, :plot, :rating, :list_ids)
  end
end
