# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Branch.create!(
  name: "あんまん支部",
  area: "東京都",
  evaluation: "3"
)

Event.create!(
  branch_id: "1",
  date: "2020-12-10 13:00",
  station1: "笹塚駅",
  postal_code: "1001701",
  prefecture_code: "13",
  address: "青ヶ島村青ヶ島村一円我が家"
)

Staff.create!(
  family_name: "テスト",
  given_name: "太郎",
  email: "test@gmail.com",
  password: "testtest"
)