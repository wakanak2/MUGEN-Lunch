class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :restaurant_id
      t.text :comment, null: false
      t.float :rate,　default: 0, null: false
      t.integer :time, null: false
      t.integer :price, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

    end
  end
end
