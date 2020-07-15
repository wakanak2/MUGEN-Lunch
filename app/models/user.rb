class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :restaurants,through: :favorites

  attachment :user_image

  validates :name_kanji, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true
  validates :user_name, presence: true



end
