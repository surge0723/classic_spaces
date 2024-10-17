# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# テストユーザーを作成
user1 = User.create!(
  name: 'Test User 1',
  email: 'user1@example.com',
  password: 'password',
  password_confirmation: 'password'
)

user2 = User.create!(
  name: 'Test User 2',
  email: 'user2@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# 各ユーザーのためにテスト用スペースを作成
Space.create!(
  space: 'Conference Room',
  place: 'Tokyo',
  facility: 'Projector, Wi-Fi',
  price: 5000,
  payment: 1,
  other: 'Great for business meetings',
  user_id: user1.id,
  category: 0
)

Space.create!(
  space: 'Private Office',
  place: 'Osaka',
  facility: 'Wi-Fi, Whiteboard',
  price: 3000,
  payment: 0,
  other: 'Quiet and ideal for working alone',
  user_id: user2.id,
  category: 1
)

puts "シードデータの作成に成功しました！"