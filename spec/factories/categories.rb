# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    # other attributes
    association :user, factory: :user
  end
end
