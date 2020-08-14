FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gimei = Gimei.name
    family_name           {gimei.last}
    first_name            {gimei.first}
    family_name_reading   {gimei.last.katakana}
    first_name_reading    {gimei.first.katakana}
    dob                   {Faker::Date.in_date_period}
  end
end