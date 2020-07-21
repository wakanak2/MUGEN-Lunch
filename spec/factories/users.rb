FactoryBot.define do
  factory :user do
    user_name {'suzu'}
    name_kanji{ '鈴木一郎	' }
    name_kana{ 'スズキイチロウ'}
    sequence(:email){ |n|"example#{n}@email.com"}
    password{'password'}
    mypoint_postcode{'2790031'}
    mypoint_address{'千葉県浦安市舞浜１−１'}

  end
end
