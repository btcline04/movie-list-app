class SearchesController < ApplicationController

  def index
    @movie = Movie.new
  end

  def omdb
    @movie = Movie.new
    @list = List.all.select(:id, :name)
    
    #use Faraday gem to connect to API
    conn = Faraday.new(:url => 'http://www.omdbapi.com')

    #get API response using api key and search params
    @resp = conn.get do |req|
      req.params['apikey'] = ENV['OMDB_API_KEY']
      req.params['s'] = params[:movie]
    end

    #parse API response, place in @movies, display to view
    body = JSON.parse(@resp.body)
    if @resp.success?
      @movies = body["Search"]
    else
      @error = "There was a timeout. Please try again."
    end
    render 'index'
  end
  
end