FactoryBot.define do
  factory :event do
    association :organization
    name { 'evento 1' }
    start_date { Date.today }
    end_date { Date.tomorrow }
  end
end
