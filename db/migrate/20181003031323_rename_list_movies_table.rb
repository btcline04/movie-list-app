class RenameListMoviesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :lists_movies, :list_movies
  end
end
