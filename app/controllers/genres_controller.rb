class GenresController < ApplicationController
	before_action :authenticate_user!

	def index
		genres =Genre.all
	end

	private
	 def genre_params
	 	params.require(:genre).permit(:name,:name_kana)
	 end
end
