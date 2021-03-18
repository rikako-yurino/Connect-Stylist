FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'test123456'}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    work_id               {Faker::Number.between(from: 2, to: 10)}
    frame_type_id         {Faker::Number.between(from: 2, to: 4)}
  end
end
