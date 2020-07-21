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
  validates :mypoint_postcode, format: {with: /\A\d{7}\z/, message: 'ハイフンなし７桁で入力してください。'}
  validates :mypoint_address, presence:{ message: '必ず住所を入力してください。' }

end
