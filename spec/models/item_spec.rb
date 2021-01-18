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
      end
    end

    # 異常系テストコード
    context "商品出品できない時" do
      it '商品名が必須であること' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it '商品の説明が必須であること' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報が必須であること' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_cost_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end

      it '発送元の地域についての情報が必須であること' do
        @item.delivery_source_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery source can't be blank"
      end

      it '発送までの日数についての情報が必須であること' do
        @item.preparation_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation day can't be blank"
      end

      it '価格についての情報が必須であること' do
        @item.selling_price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price can't be blank"
      end

    end
  end
end
