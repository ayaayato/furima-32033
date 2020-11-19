require 'rails_helper'

RSpec.describe OrderDeli, type: :model do
  
  before do
    @order = FactoryBot.build(:order_deli)
  end


  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it "全ての情報が正常の場合は購入することができる" do
        expect(@order).to be_valid
      end
      it "billが空でも購入することができる" do
        @order.bill = ""
        expect(@order).to be_valid
      end
    end

  end

    context '購入がうまくいかないとき' do
      it "postalが空だと購入できない" do
        @order.postal = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal can't be blank")
      end
      it "cityが空だと購入できない" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "banchiが空だと購入できない" do
        @order.banchi = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Banchi can't be blank")
      end
      it "phoneが空だと購入できない" do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
      it "send_area_idが未選択だと購入できない" do
        @order.send_area_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Send area must be other than 1")
      end
      it "send_area_idが空だと購入できない" do
        @order.send_area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Send area can't be blank")
      end
      it "phoneにハイフンが入っていると購入できない" do
        @order.phone = '090-123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone is invalid")
      end
      it "phoneが11桁より大きいと購入できない" do
        @order.phone = '1234567891234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it "postalにハイフンが入っていないと購入できない" do
        @order.postal = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end


    end

end
