class PostsController < ApplicationController
	before_action :authenticate_user!


	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@post = current_user.posts.new(restaurant_id: params[:restaurant_id])
		@post.post_images.build
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@post = current_user.posts.new(post_params)
		@post.restaurant_id = params[:restaurant_id].to_i
		if @post.save
			redirect_to restaurant_post_path(@restaurant,@post)
			flash[:notice] = "投稿が完了しました。"
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@restaurant = @post.restaurant
		@user = @post.user
	end

	def index
		@posts = current_user.posts.includes([:restaurant,:taggings]).page(params[:page]).per(5)
	end

	def edit
		@post = Post.find(params[:id])
		@restaurant = @post.restaurant
		@user = @post.user
	end

	def update
		@post = Post.find(params[:id])
		@restaurant = @post.restaurant
		if	@post.update(post_params)
			redirect_to restaurant_post_path(@restaurant,@post)
			flash[:notice] = "更新が完了しました。"
		else
			render :edit
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@restaurant = @post.restaurant
		@post.destroy
		redirect_to restaurant_path(@restaurant)
	end

	private

	def post_params
		params.require(:post).permit(:user_id,
									:restaurant_id,
									:comment,
									:rate,
									:time,
									:price,
									:tag_list,
									post_images_post_images:[]
									)
	end

end
