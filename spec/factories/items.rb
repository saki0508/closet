FactoryBot.define do
  factory :item do
    name {'Tシャツ'}
    association :user
  end
end
