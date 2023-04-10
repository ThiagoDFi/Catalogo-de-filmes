class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.date :date_of_birth
      t.references :favorite_genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
