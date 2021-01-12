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

   it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
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

   it "パスワードが半角英数字混合での入力必須であること" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
 end
   


 
 

end
