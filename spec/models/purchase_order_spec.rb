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
    end
  
    # 異常系テストコード
    context "商品購入できない時" do
      it "郵便番号が必須であること" do
        @purchase_order.postal_code = "1"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Postal code can't be blank"
      end

      it "県の指定があること" do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Prefecture Select"
      end

      it "Cityの記述がされていること" do
        @purchase_order.city = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "City can't be blank"
      end

      it "addressの記述がされていること" do
        @purchase_order.address = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Address can't be blank"
      end

      it "phone_numberの記述がされていること" do
        @purchase_order.phone_number = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Phone number can't be blank"
      end
    end
  
  end

end
