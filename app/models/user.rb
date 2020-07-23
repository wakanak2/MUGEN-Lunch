class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :restaurants,through: :favorites

  attachment :user_image

  validates :name_kanji, presence: { message: '名前はフルネームで入力してください（スペースなし）'}
  validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '名前はフルネームで入力してください（スペースなし）'}
  validates :user_name, presence:{ message: '必須項目です。' }
  validates :introduction, length: { maximum: 200 }

  # mypointの緯度経度取得
  geocoded_by :mypoint_address
  after_validation :geocode, if: :mypoint_address_changed?



end
