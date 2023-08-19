FactoryBot.define do
  factory :record do
    name { Faker::Lorem.sentence }
    full_name { 'John Doe' }
    amount { rand(1..100) }
    category
    association :author, factory: :user
  end
end
