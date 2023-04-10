class AddPosterToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :poster, :string
  end
end
