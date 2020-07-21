class Post < ApplicationRecord

	belongs_to :restaurant
	belongs_to :user
	has_many :post_images,dependent: :destroy

	#post_image
	accepts_attachments_for :post_images , attachment: :post_image

	#gem'acts-as-taggable-on'
	acts_as_taggable

	validates :rate, numericality: {less_than_or_equal_to: 5,greater_than_or_equal_to: 1}, presence: true
end
