class Genre < ApplicationRecord

	has_many :restaurant_genres, dependent: :destroy
	has_many :restaurants,through: :restaurant_genres

	validates :name,presence: { message: '入力必須です。' }
	validates :name_kana,presence: {  message: '全角かな入力してください。' },format: {with: /\A[ァ-ヶー－]+\z/ }
end
