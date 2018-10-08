class SearchesController < ApplicationController

  def index
  end

  def omdb
    @conn = Faraday.new(:url => 'http://www.omdbapi.com')

    @conn.get do |req|
      req.params['apikey'] = ENV['OMDB_API_KEY']
      req.params['s'] = params[:movie]
    end
    render 'index'
  end

end