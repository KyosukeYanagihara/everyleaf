# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
   email: 'test@test.com',
   name: 'テスト太郎',
   password: '123456789',
   password_confirmation: '123456789',
   created_at: Time.current,
   updated_at: Time.current
)

5.times do |n|
   Task.create!(
      name: "test#{n + 1}",
      description: "test#{n + 1}",
      deadline: Time.current.since(n.day),
      status: "未着手",
      priority: "低",
      created_at: Time.current,
      updated_at: Time.current,
      user_id: 1
   )
 end