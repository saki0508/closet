FactoryBot.define do
  factory :post do
    title {'テスト相談です'}
    text {'テスト投稿ですtest,123'}
    association :user
  end
end
