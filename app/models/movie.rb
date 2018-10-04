class Movie < ApplicationRecord
  has_many :list_movies
  has_many :lists, through: :list_movies

  def blank_stars
    5 - rating.to_i
  end
  
end