require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'commentが存在していれば保存できること' do
    expect(@comment).to be_valid
  end

  it 'commentが空だと保存できないこと' do
    @comment.comment = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Comment can't be blank")
  end

end
