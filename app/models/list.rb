class List < ApplicationRecord
  validates :name, presence: true

  has_many :list_movies
  has_many :movies, through: :list_movies

  def average_rating
    self.movies.average(:rating)
  end

  def order_list(sort_by)
    if sort_by == 'title' || sort_by.blank?
      self.movies.order(title: :asc)
    elsif sort_by == 'rating'
      self.movies.order(rating: :desc)
    else
      self.movies.order(created_at: :asc)
    end
  end

end
