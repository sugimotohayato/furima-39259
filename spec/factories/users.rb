FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    first_name { japanese_user.first.kanji }
    last_name { japanese_user.last.kanji }
    first_name_kana { japanese_user.first.katakana }
    last_name_kana { japanese_user.last.katakana }
    birth { Faker::Date.birthday }
  end
end
