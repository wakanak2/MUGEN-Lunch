class RenameNammeKanaColumeToRestaurants < ActiveRecord::Migration[5.2]
  def change
  	rename_column :restaurants, :namme_kana, :name_kana
  end
end
