FactoryBot.define do
  factory :event do
    association :organization
    association :sport
    name { Faker::Lorem.word.capitalize }

    trait :forward_one_hundred_meters do
      sport { association :sport, :one_hundred_meters }

      start_date { Faker::Date.forward(days: 1) }
      end_date { Faker::Date.forward(days: 2) }
    end

    trait :forward_javelin_throw do
      sport { association :sport, :javelin_throw }

      start_date { Faker::Date.forward(days: 1) }
      end_date { Faker::Date.forward(days: 2) }
    end

    trait :backward_one_hundred_meters do
      association :sport, :one_hundred_meters

      start_date { Faker::Date.forward(days: 11) }
      end_date { Faker::Date.backward(days: 10) }
    end

    trait :backward_javelin_throw do
      association :sport, :javelin_throw
      
      start_date { Faker::Date.backward(days: 11) }
      end_date { Faker::Date.backward(days: 10) }
    end
  end
end
