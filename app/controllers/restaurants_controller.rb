class RestaurantsController < ApplicationController
	before_action :authenticate_user!,only: [:new, :edit, :update]


	def new
		@restaurant = Restaurant.new
		@genres =Genre.all.order(:name_kana)
	end

	def index
		@q = Restaurant.ransack(params[:q])
		@restaurants = @q.result(distinct: true).page(params[:page]).per(5)

	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if  @restaurant.save
			flash[:notice] = "店舗情報登録完了しました。"
			redirect_to restaurant_path(@restaurant)
		else
			render :new
			@genres =Genre.all.order(:name_kana)
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@posts = @restaurant.posts.includes([:taggings,:user,:post_images])
		gon.restaurant_id = @restaurant.id
		gon.restaurant_average = @restaurant.posts.average(:rate).to_f.round(1)
		@post = @posts.find_by(user_id: current_user.id)
		@favorite = @restaurant.favorites.find_by(user_id: current_user.id)
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
		if current_user.latitude.present?
		latitude = current_user.latitude.to_f
		longitude = current_user.longitude.to_f
		myrestaurants = Restaurant.within_box(0.621371, latitude, longitude)
		@q = myrestaurants.ransack(params[:q])
		@restaurants = @q.result
		@restaurants = @restaurants.page(params[:page]).per(5)
		else
		redirect_to edit_user_path(current_user.id)
		flash[:notice] = "My pointを登録してください。"
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
   										   :closed,
   										   :latitude,
   										   :longitude,
   										   genre_ids:[])
	end

end
