require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が正常の場合は新規登録することができる" do
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_kanaが空では登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "first_kanaの名前が空では登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "last_kanaにカタカナ以外が使用された場合は登録できない" do
        @user.last_kana = "たけウチ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
      it "first_kanaにカタカナ以外が使用された場合は登録できない" do
        @user.first_kana = "りキ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
      it "passwordがアルファベットのみでは登録できない"do
        @user.password = "konbanwa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみでは登録できない"do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_nameに日本語以外が入力されている場合は登録できない" do
        @user.last_name = "takeuchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameに日本語以外が入力されている場合は登録できない" do
        @user.first_name = "takeuchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
    end
  end
end