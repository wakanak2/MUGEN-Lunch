class RemoveRestaurantIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :restaurant_id, :integer
  end
end
