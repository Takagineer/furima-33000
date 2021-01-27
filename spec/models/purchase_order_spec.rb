require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    @purchase_order = FactoryBot.build(:item)
  end

  describe "商品購入機能" do
    # 正常系テストコード
    context "商品購入ができる時" do
      it "全項目入力されていれば購入できる" do
        expect(@purchase_order.valid?).to eq true
      end
    end
  
  #  # 異常系テストコード
  #   context "商品購入できない時" do
  #     it "" do
  #     end

  end

end
