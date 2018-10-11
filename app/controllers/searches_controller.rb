class SearchesController < ApplicationController

  def index
    @list = List.all.select(:id, :name)
    @movie = Movie.new
  end

  def omdb
    @movie = Movie.new
    @list = List.all.select(:id, :name)
    
    conn = Faraday.new(:url => 'http://www.omdbapi.com')

    @resp = conn.get do |req|
      req.params['apikey'] = ENV['OMDB_API_KEY']
      req.params['s'] = params[:movie]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @movies = body["Search"]
    else
      @error = "There was a timeout. Please try again."
    end
    render 'index'
  end
end