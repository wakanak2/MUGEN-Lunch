class FavoritesController < ApplicationController
	before_action :set_user
	before_action :authenticate_user!

	def index

		if params[:keyword]
		selection = params[:keyword]
		@all_favorites = Favorite.sort(selection)
		favorites = @all_favorites.includes([:restaurant]).where(user_id: @user.id)
		@favorites = favorites.page(params[:page]).per(5)

    	else
		@favorites = current_user.favorites.includes([:restaurant])


		end
	end

	def create
  		@restaurant = Restaurant.find(params[:restaurant_id])
  		@favorite = @restaurant.favorites.new(user_id: current_user.id)
		@favorite.save
	end

	def destroy
  		@restaurant = Restaurant.find(params[:restaurant_id])
  		@favorite = current_user.favorites.find_by(restaurant_id: @restaurant.id)
		@favorite.destroy
	end



	private

	def set_user
		@user = current_user
	end



end
