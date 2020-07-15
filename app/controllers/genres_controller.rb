class GenresController < ApplicationController

	def index 
		genres =Genre.all


	private
	 def genre_params
	 	params.require(:genre).permit(:name,:name_kana)
	 end
end
