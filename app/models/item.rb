class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  with_options presence: true do

  validates :title
  validates :explanation
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :delivery_source_id
  validates :preparation_day_id
  validates :selling_price
  validates :user_id

  has_one_attached :image
  belongs_to_active_hash :genre

end
