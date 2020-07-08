class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :user_id
      t.string :post_id
      t.string :post_image
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
