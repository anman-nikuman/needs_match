# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Branch.create!(
  name: "あんまん支店",
  area: "東京都",
  evaluation: "3"
)

Event.create!(
  branch_id: "1",
  date: "2020-12-10",
  station: "笹塚駅",
  postal_code: "1001701",
  prefecture_code: "13",
  city: "青ヶ島村",
  street: "青ヶ島村一円",
  building: "我が家"
)