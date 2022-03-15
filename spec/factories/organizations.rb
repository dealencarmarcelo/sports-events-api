FactoryBot.define do
  factory :organization do
    association :user

    name { 'Comitê Olímico Brasileiro' }
    code { Faker::Lorem.characters(number: 8) }
  end
end
