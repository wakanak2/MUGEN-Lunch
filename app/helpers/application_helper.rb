module ApplicationHelper

	def restaurant_ave_rate(restaurant)
		restaurant.posts.average(:rate).to_f.round(1)
	end


end
