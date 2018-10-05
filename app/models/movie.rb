class Movie < ApplicationRecord
  has_many :list_movies
  has_many :lists, through: :list_movies

  def self.order_list(sort_order)
    if sort_order == 'title' || sort_order.blank?
      order(title: :asc)
    elsif sort_order == 'rating'
      order(rating: :asc)
    else
      order(created_at: :asc)
    end
  end

end