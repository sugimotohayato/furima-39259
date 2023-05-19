FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 40) }
    data { Faker::Lorem.characters(number: 1000) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_id { Faker::Number.between(from: 2, to: 3) }
    state_id { Faker::Number.between(from: 2, to: 48) }
    shipping_id { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/momo.png'), filename: 'momo.png')
    end
  end
end
