FactoryBot.define do
  factory :tea do
    title { Faker::Beer.name }
    description { Faker::Lorem.sentence }
    temperature {Faker::Number.between(from: 70, to: 110)}
    brew_time {Faker::Number.between(from: 3, to: 60)}
  end
end