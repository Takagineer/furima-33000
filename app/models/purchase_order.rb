class PurchaseOrder 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号エラー"}
    validates :prefecture_id, numericality: { other_than: 1, message: '県指定'}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "町名記入"}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "住所記入"}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "電話番号を記入"}
    validates :user_id, presence: true
    validates :item_id, presence: true
  end

  def save
    value = Order.create(user_id: user_id,item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: value.id)

  end
end



