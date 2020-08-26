require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image1.jpg')
  end

  it 'nameとimageがあれば保存できること' do
    expect(@item).to be_valid
  end

  it 'nameが空だと保存できないこと' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it 'imageが空だと保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
end
