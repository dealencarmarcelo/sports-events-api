FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.first_name.underscore }
    email { Faker::Internet.email }
    age { Faker::Number.between(from: 18, to: 60) }
    role { 'admin' }

    trait :admin do
      role { 'admin' }
    end

    trait :competitor do
      role { 'competitor' }
    end
  end
end
