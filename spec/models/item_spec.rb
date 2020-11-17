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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "status_idが空だと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "status_idが選択されていないと登録できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが選択されていないと登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "send_area_idが空だと登録できない" do
        @item.send_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send area can't be blank")
      end
      it "send_area_idが選択されていないと登録できない" do
        @item.send_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send area must be other than 1")
      end
      it "send_fee_idが空だと登録できない" do
        @item.send_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send fee can't be blank")
      end
      it "send_fee_idが選択されていないと登録できない" do
        @item.send_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send fee must be other than 1")
      end
      it "send_day_idが空だと登録できない" do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it "send_day_idが選択されていないと登録できない" do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day must be other than 1")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字以外だと登録できない" do
        @item.price = 'ひゃく'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300未満だと登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999より大きいと登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end
