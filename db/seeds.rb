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
    name_kanji: "山田　花子",
    name_kana: "ヤマダ　ハナコ",
    user_name: "yamahana",
		)
