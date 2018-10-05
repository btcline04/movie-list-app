class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
  end

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

  def show
  end

  def edit
  end

  def update
    @movie = Movie.find(params[:id])
    @movie = @movie.update(movie_params)
    redirect_to root_path
  end

  def destroy
    @movie.destroy
    redirect_to root_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :poster, :director, :plot, :rating, :list_ids => [])
  end
end
