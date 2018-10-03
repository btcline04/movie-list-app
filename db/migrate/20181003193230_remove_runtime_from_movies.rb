class RemoveRuntimeFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :runtime, :integer
  end
end
