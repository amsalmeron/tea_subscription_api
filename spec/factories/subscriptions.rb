FactoryBot.define do
  factory :subscription do
    title { Faker::Beer.name }
    price {Faker::Number.between(from: 10, to: 100)}
    status { Faker::Boolean.boolean }
    frequency {Faker::Number.between(from: 1, to: 4)}
  end
end