# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    full_name { Faker::Name.name } # Add this line
  end
end

#   spec/factories/categories.rb
#   FactoryBot.define do
#     factory :category do
#       name { Faker::Lorem.word }
#       user
#     end
#   end
