FactoryBot.define do
  factory :event do
    name { 'evento 1' }
    start_date { Date.today }
    end_date { Date.tomorrow }
    host_id { 1 }
  end
end
