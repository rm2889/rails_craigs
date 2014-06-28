FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { rand(100) }
    category
  end
end
