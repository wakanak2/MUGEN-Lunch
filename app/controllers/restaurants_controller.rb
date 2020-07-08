class RestaurantsController < ApplicationController

	def new
		@restaurant = Restaurant.new
	end

	def index
		@restaurants = Restaurant.all
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		byebug
		if  @restaurant.save
			flash[:notice] ="店舗情報登録完了しました。"
			redirect_to restaurant_path
		else
			render :new
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if  restaurant.update(restaurant_params)
			flash[:notice] = "店舗情報更新完了しました。"
			redirect_to restaurant_path
		else
			render :edit
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name,
   										   :branch,
   										   :name_kana,
   										   :postcode,
   										   :address,
   										   :tel,
   										   :weekday_start,
   										   :weekday_finish,
   										   :weekend_start,
   										   :weekend_finish,
   										   :holiday,
   										   :seat,
   										   :homepage,
   										   :standing,
   										   :smoking,
   										   :closed )
	end
end
