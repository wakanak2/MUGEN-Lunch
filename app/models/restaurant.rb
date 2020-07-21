class Restaurant < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites
	has_many :restaurant_genres, dependent: :destroy
	has_many :genres, through: :restaurant_genres


	validates :name, presence: { message: '必須項目です。' }
	validates :name_kana, presence: { message: '必須項目です。全角かな入力' },format: { with: /\A[ァ-ヶー－]+\z/}
	validates :postcode, presence: { message: '必須項目です。ハイフンなし７桁' },format: {with: /\A^\d{7}$\z/}
	validates :address, presence: { message: '必須項目です。' }
	validates :tel, format: {with:/\A^\d{10}$|^\d{11}$\z/}
	validates :seat,format: {with: /\A[0-9]+\z/}
	validates :standing, inclusion: { in: ["あり", "なし"] }
	validates :closed, inclusion: { in: ["閉店済", "開業中"] }
	validates :smoking,presence: true

	# 住所の緯度経度取得
  	geocoded_by :address
	after_validation :geocode, if: :address_changed?


	enum standing: {あり:true, なし:false}
	enum smoking: {禁煙:0, 喫煙:1, 分煙:2}
	enum closed: {閉店済:true, 開業中:false}


	attachment :post_images_post_image

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	def posted_by?(user)
  		posts.where(user_id: user.id).exists?
  	end

  	def find_ownpost(user, restaurant)
  		posts.find_by(user_id: user.id, restaurant_id: restaurant.id)
  	end

	def restaurant_ave_rate
		self.posts.average(:rate).to_f.round(1)
	end


	def mypoint_restaurant_search(user)
		self.near()
	end


	ransacker :average do
		Arel.sql('AVG("posts"."rate")')
	end


	scope :sort_by_rate_avg_asc, -> {order(rate: :asc).left_joins(:posts)}
	scope :sort_by_rate_avg_desc, -> {order(rate: :desc).left_joins(:posts)}

end
