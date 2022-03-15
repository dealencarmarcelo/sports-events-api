FactoryBot.define do
  factory :sport do
    trait :one_hundred_meters do
      name { '100m rasos' }
      win_condition { 'shorter' }
      has_attempts { false }
      max_attempts { 1 }
    end

    trait :javelin_throw do
      name { 'Lançamento de Dardo' }
      win_condition { 'greater' }
      has_attempts { true }
      max_attempts { 3 } 
    end
  end
end
