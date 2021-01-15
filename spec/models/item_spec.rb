require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    # 正常系テストコード
    context "商品出品できる時" do
      it '全項目入力されていれば保存できる' do
        @item.save
        @item.valid?
        binding.pry
      end
    end

    # 異常系テストコード
    contect "商品出品できない時" do
      it '' do
      end
    end
  end
end
