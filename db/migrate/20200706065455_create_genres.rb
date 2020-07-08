class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.integer :restaurant_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
