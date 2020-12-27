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
  date: "2021-1-31 13:00",
  station1: "新宿駅",
  station2: "東京駅",
  postal_code: "1001701",
  prefecture_code: "13",
  address: "青ヶ島村青ヶ島村一円我が家"
)

Branch.create!(
  name: "肉まん支部",
  area: "東京都",
  evaluation: "5"
)

Event.create!(
  branch_id: "2",
  date: "2021-1-31 13:00",
  station1: "笹塚駅",
  station2: "代田橋",
  postal_code: "1001701",
  prefecture_code: "13",
  address: "青ヶ島村青ヶ島村一円どこか"
)

Event.create!(
  branch_id: "1",
  date: "2020-12-28 13:00",
  station1: "笹塚駅",
  station2: "代田橋",
  postal_code: "1001701",
  prefecture_code: "13",
  address: "青ヶ島村青ヶ島村一円どこか"
)

Staff.create!(
  nm_id: "1",
  family_name: "山田",
  given_name: "太郎",
  email: "test@test",
  password: "password",
  is_deleted: false
)

# Affiliation.create!(
#   branch_id: "1",
#   staff_id: "1"
# )

# Operation.create!(
#   event_id: "1",
#   staff_id: "1",
#   status: 0
# )

Staff.create!(
  nm_id: "2",
  family_name: "佐藤",
  given_name: "二郎",
  email: "test1@test",
  password: "password",
  is_deleted: false
)

Affiliation.create!(
  branch_id: "1",
  staff_id: "1"
)

Operation.create!(
  event_id: "1",
  staff_id: "1",
  status: 2
)

Affiliation.create!(
  branch_id: "2",
  staff_id: "2"
)

Operation.create!(
  event_id: "2",
  staff_id: "2",
  status: 1
)

# Affiliation.create!(
#   branch_id: "1",
#   staff_id: "1"
# )

# Operation.create!(
#   event_id: "3",
#   staff_id: "1",
#   status: 0
# )
