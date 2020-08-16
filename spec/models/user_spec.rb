require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '全ての値が正しく入力されていれば保存できること' do
    expect(@user).to be_valid
  end
  it 'ニックネームが空だと保存できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'メールアドレスが空だと保存できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it '使用済みのメールアドレスだと保存できないこと' do
    @user2 = FactoryBot.create(:user)
    @user.valid?
    expect(@user.errors.full_messages).to include("Email has already been taken")

  end
  it 'メールアドレスは＠を含む文字列で無いと保存されないこと' do
    @user.email = "sample"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'パスワードが空だと保存できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    
  end
  it 'パスワードが６文字以下では保存できないこと' do
    @user.password = "taro1"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'パスワードは全角だと保存できないこと' do
    @user.password = "ｔａｒｏ１２３４"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    
  end
  it 'パスワードは半角数字だけでは保存できないこと' do
    @user.password = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password include both letters and numbers")
  end
  it 'パスワードは半角英字だけでは保存できないこと' do
    @user.password = "tarotaro"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password include both letters and numbers")
  end
  it 'password_confirmationがパスワードと一致しないと保存できないこと' do
    @user.password_confirmation = "sample1234"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  

end
