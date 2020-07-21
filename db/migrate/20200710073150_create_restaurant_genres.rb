class CreateRestaurantGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_genres do |t|
      t.integer :genre_id
      t.integer :restaurant_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
