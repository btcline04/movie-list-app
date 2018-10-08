class SearchesController < ApplicationController

  def index
  end

  def omdb
    conn = Faraday.new(:url => 'http://www.omdbapi.com')

    @resp = conn.get do |req|
      req.params['apikey'] = ENV['OMDB_API_KEY']
      req.params['s'] = params[:movie]
    end

    body_hash = JSON.parse(@resp.body)
    @movies = body_hash['search']
    render 'index'
  end

end