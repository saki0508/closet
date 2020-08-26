FactoryBot.define do
  factory :comment do
    comment {'テストコメントabc123'}
    association :user
    association :post
  end
end
