class CreateListMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :list_movies do |t|

      t.timestamps
    end
  end
end
