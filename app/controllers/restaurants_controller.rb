class RestaurantsController < ApplicationController

	def new
		@restaurant = Restaurant.new
		@genres =Genre.all.order(:name_kana)
	end

	def index
		@q =Restaurant.ransack(params[:q])
		@restaurant = @q.result.includes(:posts)
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if  @restaurant.save!
			flash[:notice] = "店舗情報登録完了しました。"
			redirect_to restaurant_path(@restaurant)
		else
			render :new
			@genres =Genre.all.order(:name_kana)
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		gon.restaurant_id = @restaurant.id
		gon.restaurant_average = @restaurant.posts.average(:rate).to_f.round(1)
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if  @restaurant.update(restaurant_params)
			flash[:notice] = "店舗情報更新完了しました。"
			redirect_to restaurant_path
		else
			render :edit
		end
	end

	def map
		respond_to do |format|
			format.js
		end
	end

	def search
		@q = Restaurant.search(search_params)
		@restaurant = @q.result.includes(:posts)
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
   										   :closed,
   										   :latitude,
   										   :longitude,
   										   genre_ids:[])
	end

	def search_params
		params.require(:q).permit!
	end
end
