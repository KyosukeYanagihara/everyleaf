# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
   User.create!(
      name: "test_name#{n}",
      email: "test#{n}@test.com",
      password: '123456789',
      password_confirmation: '123456789',
      created_at: Time.current,
      updated_at: Time.current
   )
end
User.create!(
   name: '管理者',
   email: 'admin@admin.com',
   password: '123456789',
   password_confirmation: '123456789',
   admin: true,
   created_at: Time.current,
   updated_at: Time.current,
   )
11.times do |n|
   User.all.each do |user|
      user.tasks.create!(
         name: "test#{n + 1}",
         description: "test#{n + 1}",
         deadline: Time.current.since(n.day),
         status: "未着手",
         priority: "低",
         created_at: Time.current,
         updated_at: Time.current,
      )
   end
end
10.times do |n|
   Label.create!( name: "test#{n}")
end
