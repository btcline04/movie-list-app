class List < ApplicationRecord
  validates :name, presence: true

  has_many :lists_movies
  has_many :movies, through: :lists_movies
end
