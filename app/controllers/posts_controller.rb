class PostsController < ApplicationController


	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@post = current_user.posts.new(restaurant_id: params[:restaurant_id])
		@post.post_images.build
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@post = current_user.posts.new(restaurant_id: params[:restaurant_id])
		if @post.save!
			redirect_to restaurant_post_path
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
		@posts = current_user.posts
	end

	def edit
		@post = Post.find(params[:id])
		@restaurant = @post.restaurant
		@user = @post.user
	end

	def update
		@post = Post.find(params[:id])
		if	@post.update(post_params)
			redirect_to post_path(@post)
			flash[:notice] = "更新が完了しました。"
		else
			render :edit
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to restaurant_path
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
