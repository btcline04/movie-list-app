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
      flash[:error] = "Please try again!"
      redirect_to new_movie_path
    end
  end

  def add_api_movie_to_list
    conn = Faraday.new(:url => 'http://www.omdbapi.com')

    @resp = conn.get do |req|
      req.params['apikey'] = ENV['OMDB_API_KEY']
      req.params['i'] = params[:movie_id]
    end

    body = JSON.parse(@resp.body)
    movie_params = { title: body["Title"], genre: body["Genre"], year: body["Year"], poster: body["Poster"], plot: body["Plot"], director: body["Director"], list_ids: params[:movie][:list_ids], rating: params[:movie][:rating] }
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      flash[:error] = "Unable to save movie. Try again."
      render 'search'
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
