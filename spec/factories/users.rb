FactoryBot.define do
  factory :user do
    nickname {'taro'}
    email {'taro@com'}
    password {'taro1234'}
    password_confirmation {'taro1234'}
  end
end
