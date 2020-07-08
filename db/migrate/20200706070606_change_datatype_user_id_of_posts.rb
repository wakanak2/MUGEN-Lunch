class ChangeDatatypeUserIdOfPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :user_id, :integer
  	change_column :posts, :restaurant_id, :integer
  end
end
