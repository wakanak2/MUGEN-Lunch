class FavoritesController < ApplicationController
	before_action :set_user

	def index
		@favorites = current_user.favorites
	end

	def create
  		restaurant = Restaurant.find(params[:restaurant_id])
  		favorite = current_user.favorites.new(restaurant_id: restaurant.id)
		favorite.save
		redirect_to restaurant_path(restaurant)
	end

	def destroy
  		restaurant = Restaurant.find(params[:restaurant_id])
  		favorite = current_user.favorites.find_by(restaurant_id: restaurant.id)
		favorite.destroy
		redirect_to restaurant_path(restaurant)
	end

	def set_user
		@user = current_user
	end

end
