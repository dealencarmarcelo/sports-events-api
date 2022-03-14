FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name.underscore }
    email { Faker::Internet.email }
    role { 'participant' }
  end
end
