class Movie < ApplicationRecord
  has_many :lists_movie
  has_many :lists, through: :lists_movie
end
