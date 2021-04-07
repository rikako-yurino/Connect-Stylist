FactoryBot.define do
  factory :stylist do
    email                 {Faker::Internet.free_email}
    password              {'test123456'}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    license               {Faker::Lorem.sentence}
    profile               {Faker::Lorem.sentence}

    
    after(:build) do |stylist|
      stylist.stylist_photo.attach(io: File.open('public/images/user_photo01.png'), filename: 'user_photo01.png')
    end
  end
end
