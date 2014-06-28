FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { rand(100) }
    category
  end
end
