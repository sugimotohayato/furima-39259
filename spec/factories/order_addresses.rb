FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    state_id { 1 }
    city { '東京市' }
    address { '東京1-1' }
    building { '東京ハイツ' }
    tel { '09000000000' }
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
