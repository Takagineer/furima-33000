class PurchaseOrder 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "City can't be blank"}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "Address can't be blank"}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "Phone number input only number"}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    value = Order.create(user_id: user_id,item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: value.id)

  end
end



