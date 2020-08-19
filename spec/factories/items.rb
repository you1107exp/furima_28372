FactoryBot.define do
  factory :item do
    image                  {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec_test.png'))}
    name                   {Faker::Lorem.word}
    explanation            {Faker::Lorem.sentence}
    category_id            {Faker::Number.between(from: 2, to: 11)}
    condition_id           {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id     {Faker::Number.between(from: 2, to: 3)}
    seller_prefecture_id   {Faker::Number.between(from: 2, to: 48)}
    days_until_shipping_id {Faker::Number.between(from: 2, to: 4)}
    price                  {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
