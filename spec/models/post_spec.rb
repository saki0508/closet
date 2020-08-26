require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.images = fixture_file_upload('public/images/test_image1.jpg','public/images/test_image2.jpg')
  end

  it 'titleとtextとimagesが存在していれば保存できること' do
    expect(@post).to be_valid
  end

  it 'titleとtextが存在していれば保存できること' do
    @post.images = nil
    expect(@post).to be_valid
  end

  it 'titleが空だと保存できないこと' do
    @post.title = nil
    @post.valid?
    expect(@post.errors.full_messages).to include("Title can't be blank")
  end

  it 'textが空だと保存できないこと' do
    @post.text = nil
    @post.valid?
    expect(@post.errors.full_messages).to include("Text can't be blank")
  end
end
