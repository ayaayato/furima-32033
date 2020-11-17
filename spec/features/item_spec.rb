require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品の登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が正常の場合は登録することができる" do
        expect(@item).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "titleが空だと登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "imageが空だと登録できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "status_idが選択されていないと登録できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "category_idが選択されていないと登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "send_area_idが選択されていないと登録できない" do
        @item.send_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it "send_fee_idが選択されていないと登録できない" do
        @item.send_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send fee must be other than 1")
      end
      it "send_day_idが選択されていないと登録できない" do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day must be other than 1")
      end
      
    end
  end
end
