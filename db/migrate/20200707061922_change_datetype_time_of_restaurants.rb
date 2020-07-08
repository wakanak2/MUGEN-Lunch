class ChangeDatetypeTimeOfRestaurants < ActiveRecord::Migration[5.2]
  def change
		change_column :restaurants, :weekday_start, :time
		change_column :restaurants, :weekday_finish, :time
		change_column :restaurants, :weekend_start, :time
		change_column :restaurants, :weekend_finish, :time
  end
end
