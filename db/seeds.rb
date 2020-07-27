# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	User.create!(
	email: "a@a",
    password: "123456",
    name_kanji: "山田花子",
    name_kana: "ヤマダハナコ",
    user_name: "yamahana",
		)

	[
		['和食','ワショク'],['洋食','ヨウショク'],['中華','チュウカ'],['そば','ソバ'],['うどん','ウドン'],
		['ラーメン','ラーメン'],['寿司','スシ'],['揚げ物','アゲモノ'],['定食','テイショク'],['ハンバーグ','ハンバーグ'],
		['イタリアン','イタリアン'],['パスタ','パスタ'],['ピザ','ピザ'],['焼肉','ヤキニク'],['タイ料理','タイリョウリ'],
		['おにぎり','オニギリ'],['フランス料理','フランスリョウリ'],['カレー','カレー'],['その他','ソノタ']
	].each do |name, name_kana|
		Genre.create!(
			{name: name, name_kana: name_kana}
			)
	end
