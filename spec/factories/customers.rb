FactoryBot.define do
  factory :customer do
    firstname { Faker::Beer.name }
    lastname { Faker::Beer.name }
    email {Faker::Lorem.sentence}
    address {Faker::Lorem.sentence}
  end
end
