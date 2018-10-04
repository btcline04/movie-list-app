class RemoveYearFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :year, :string
  end
end
