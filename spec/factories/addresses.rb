FactoryBot.define do
  factory :address do
    postal_code   {"000-0000"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Gimei.address.city.kanji}
    address       {Gimei.address.town.kanji}
    building      {Faker::Lorem.word}
    phone_number  {Faker::Number.leading_zero_number(digits: 11)}
    association :purchase
  end
end
