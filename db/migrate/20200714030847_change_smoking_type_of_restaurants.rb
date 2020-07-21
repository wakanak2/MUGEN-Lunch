class ChangeSmokingTypeOfRestaurants < ActiveRecord::Migration[5.2]
  def change
  	change_column :restaurants, :smoking, :integer, default: "0", null: false
  end
end
