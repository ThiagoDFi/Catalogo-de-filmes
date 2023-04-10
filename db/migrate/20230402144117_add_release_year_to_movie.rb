class AddReleaseYearToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :release_year, :interger
  end
end
