class Movie < ApplicationRecord
  has_many :lists_movies
  has_many :lists, through: :list_movies
end
