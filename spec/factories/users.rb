FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name.underscore }
    email { Faker::Internet.email }

    trait :admin do
      role { 'admin' }
    end

    trait :competitor do
      role { 'competitor' }
    end
  end
end
