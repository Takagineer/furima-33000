require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    @purchase_order = FactoryBot.build(:purchase_order)
  end

  describe "商品購入機能" do
    # 正常系テストコード
    context "商品購入ができる時" do
      it "全項目入力されていれば購入できる" do
        expect(@purchase_order.valid?).to eq true
      end

      it "building_nameが記述されていなくても保存できる" do
        @purchase_order.building_name = ""
        @purchase_order.valid?
        expect(@purchase_order.valid?).to eq true
      end
    end


  
    # 異常系テストコード
    context "商品購入できない時" do
      it "郵便番号が必須であること" do
        @purchase_order.postal_code = "1"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Postal code can't be blank"
      end

      it "県の指定があるが、県以外を指定している時" do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Prefecture Select"
      end

      it "Cityの記述がない時" do
        @purchase_order.city = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "City can't be blank"
      end

      it "addressの記述がない時" do
        @purchase_order.address = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Address can't be blank"
      end

      it "phone_numberの記述がない時" do
        @purchase_order.phone_number = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Phone number can't be blank"
      end

      it "tokenがない時" do
        @purchase_order.token = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Token can't be blank"
      end
    end
  
  end

end
