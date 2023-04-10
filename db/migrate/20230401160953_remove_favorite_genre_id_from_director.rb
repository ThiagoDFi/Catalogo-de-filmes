class RemoveFavoriteGenreIdFromDirector < ActiveRecord::Migration[6.1]
  def change
    remove_column :directors, :favorite_genre_id, :string
  end
end
