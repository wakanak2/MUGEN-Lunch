class AddNameKanaToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name_kana, :string
  end
end
