class AddMovieGenreToDirector < ActiveRecord::Migration[6.1]
  def change
    add_reference :directors, :movie_genre, null: false, foreign_key: true
  end
end
