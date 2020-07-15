class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :post_image_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
