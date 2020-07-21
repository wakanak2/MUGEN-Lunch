class Favorite < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	def self.sort(selection)
		case selection
			when 'new'
				favorites = Favorite.order(created_at: :desc).includes([:restaurant])
			when 'old'
				favorites = Favorite.order(created_at: :asc).includes([:restaurant])
		end

		return favorites
	end


end
