class Post < ApplicationRecord
	has_many :post_images
	belongs_to :restaurant
end
