class CreateJoinTableListsMovies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lists, :movies do |t|
      t.index [:list_id, :movie_id]
      t.index [:movie_id, :list_id]
    end
  end
end
