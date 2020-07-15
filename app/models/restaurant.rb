class Restaurant < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites
	has_many :restaurant_genres, dependent: :destroy
	has_many :genres, through: :restaurant_genres


  	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	enum standing: {あり:true, なし:false}
	enum smoking: {禁煙:0, 喫煙:1, 分煙:2}
	enum closed: {閉店済:true, 開業中:false}

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  	end

end
