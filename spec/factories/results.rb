FactoryBot.define do
  factory :result do
    association :user
    association :event

    trait :javelin_throw do
      association :event, :forward_javelin_throw

      unit { 'meters' }
      value { Faker::Number.between(from: 10.0, to: 100.0).round(2) }
    end

    trait :one_hundred_meters do
      association :event, :one_hundred_meters

      unit { 'seconds' }
      value { Faker::Number.between(from: 0.0, to: 50.0).round(2) }
    end
  end
end
