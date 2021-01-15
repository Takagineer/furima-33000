class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :deliverysource, :preparationday, :shippingcost, :status
  has_one_attached :image

  with_options presence: true do
    validates :title, :explanation 
    validates :category_id, :status_id, :shipping_cost_id, :delivery_source_id, :preparation_day_id, :selling_price, numericality: { other_than: 1}
  end
  
  

end
