class Post < ApplicationRecord

	belongs_to :restaurant
	belongs_to :user
	has_many :post_images,dependent: :destroy

	validates :comment, presence: true, length: { maximum: 200, message: '２００文字以下です。' }
	validates :time, format: {with:/\A[0-9]+\z/, message: '半角数値で入力してください。'}
	validates :price, format: {with:/\A[0-9]+\z/, message: '半角数値で入力してください。'}


	#post_image
	accepts_attachments_for :post_images , attachment: :post_image

	#gem'acts-as-taggable-on'
	acts_as_taggable

end
