class Restaurant < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	belongs_to :genre, optional: true

	enum standing: {あり:true, なし:false}
	enum smoking: {禁煙:0, 喫煙:1, 分煙:2}
	enum closed: {閉店済:true, 開業中:false}

	def weekday_lunchtime
		weekday_start + "〜" + weekday_finish
	end

	def weekend_lunchtime
		weekend_start + "〜" + weekend_finish
	end
end
