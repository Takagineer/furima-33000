class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :deliverysource, :preparation, :shippingcost, :status
  has_one_attached :image

  with_options presence: true do

    validates :title, :explanation, :category_id, :status_id, :shipping_cost_id, :delivery_source_id, :preparation_day_id, :selling_price, :user_id
    validates :title, :explanation, :category_id, :status_id, :shipping_cost_id, :delivery_source_id, :preparation_day_id, :selling_price, numericality: { other_than: 1}
  end
  
  

end
