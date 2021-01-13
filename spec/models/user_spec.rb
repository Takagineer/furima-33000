require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe "ユーザー新規登録" do
   it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
   end

  describe 'ユーザー登録ができない時' do
   it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
   end
  end

   it "emailにおける一意性の担保" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
   end

   it "emailには@を含む必要があること" do
      @user.email = "tanakatanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
   end

   it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it "パスワードが６文字以上であること" do
      @user.password = "111oo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
 end

  describe 'ユーザー登録ができない時' do 
   it "パスワードが数字のみでは登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
  

   it "パスワードがアルファベットのみでは登録できないこと" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "パスワードが全角では登録できないこと" do
      @user.password = "aaa１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
  end
  
   it "パスワードは２回入力すること" do
      @user.password = "111iii"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "パスワードと確認用は一致すること" do
      @user.password = "111iii"
      @user.password_confirmation = "222iii"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "ユーザー本名は苗字が必須であること" do
      @user.family_name = ""
      @user.last_name = "田仲"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
   end
   
   it "ユーザー本名は名前が必須であること" do
      @user.family_name = "田中"
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
   end

   it "familynameは全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
   end

   it "lastnameは全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
    @user.last_name = "tanaka"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid")
 end

   it "family_name_kanaは入力必須であること" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
   end

   it "family_name_kanaは全角カタカナ以外での入力必須であること" do
      @user.family_name_kana = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
   end

   it "last_name_kanaは全角カタカナ以外での入力必須であること" do
      @user.last_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
   end

   it "last_name_kanaは入力必須であること" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
   end

   it "birthdayは入力必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end

 end
   
end
