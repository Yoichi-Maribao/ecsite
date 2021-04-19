# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  :email => "admin@email.com",
  :password => "aaaaaa"
)

Genre.create!(
  :name => "ケーキ"
)

Genre.create!(
  :name => "クッキー"
)

Item.create!(
  :genre_id => 1,
  :name => "シフォンケーキ",
  :description => "みんな大好きシフォンケーキです。ほっぺたがおちるくらい美味しいです。",
  :image => open("./app/assets/images/cake.jpeg"),
  :price => 600
)

Item.create!(
  :genre_id => 2,
  :name => "お手軽クッキー",
  :description => "お手軽に食べれるクッキーです。",
  :image => open("./app/assets/images/cookie.jpeg"),
  :price => 300
)

EndUser.create!(
  last_name: "試験",
  first_name: "太郎",
  kana_last_name: "シケン",
  kana_first_name: "タロウ",
  email: "aa@a",
  postcode: "0000000",
  address: "東京都豊島区",
  phone_number: "00000000000",
  password: "testing",
)