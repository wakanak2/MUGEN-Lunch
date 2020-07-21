class RestaurantGenre < ApplicationRecord
	belongs_to :genre, optional: true
	belongs_to :restaurant, optional: true
end
