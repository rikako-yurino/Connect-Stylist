FactoryBot.define do
  factory :reservation do
    reservation_date  {Date.parse("2022/01/01")}
    time_zone_id      {Faker::Number.between(from: 2, to: 12)}
    purpose_id        {Faker::Number.between(from: 2, to: 7)}
    style_id          {Faker::Number.between(from: 2, to: 8)}
    remarks           {Faker::Lorem.sentence}
  end
end
