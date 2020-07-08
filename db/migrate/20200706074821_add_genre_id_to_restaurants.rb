class AddGenreIdToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :genre_id, :integer
  end
end
