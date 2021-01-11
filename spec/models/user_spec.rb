require 'rails_helper'

RSpec.describe User, type: :model do
 describe "ユーザー新規登録" do
   it "nicknameが空だと登録できない" do
    user = User.new(nickname:"", email:"tanaka@tanaka", password: "tanaka10", password_confirmation:"tanaka10",family_name:"田中",last_name:"田仲",family_name_kana:"タナカ",last_name_kana:"タナカ",birthday:"1930")
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")

   end
   it "nicknameが空だと登録できない" do
   end
  end
end
