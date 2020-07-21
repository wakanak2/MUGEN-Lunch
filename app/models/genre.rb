class Genre < ApplicationRecord

	has_many :restaurant_genres, dependent: :destroy
	has_many :restaurants,through: :restaurant_genres
end
