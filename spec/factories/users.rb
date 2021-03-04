FactoryBot.define do
  factory :user do
    name { 'admin_name' }
    email { 'admin@email.com' }
    password { 'admin_password' }
    password_confirmation { 'admin_password' }
    admin { true }
  end
  factory :general_user, class: User do
    name { 'general_name' }
    email { 'general@email.com' }
    password { 'general_password' }
    password_confirmation { 'general_password' }
  end
  factory :third_user, class: User do
    name { 'teat_user_name3' }
    email { 'teat_user@email.com' }
    password { 'teat_user_password3' }
    password_confirmation { 'teat_user_password3' }
  end
end
