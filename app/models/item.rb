class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :delivery_source
  belongs_to :preparation_day
  belongs_to :status

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title, :explanation, :image
    validates :category_id, :status_id, :shipping_cost_id, :delivery_source_id, :preparation_day_id, :selling_price, numericality: { other_than: 1}
  end
  
  with_options format: { with:/\A[0-9]+\z/} do
    validates :selling_price
  end

  validates_inclusion_of :selling_price, in: 300..9_999_999
end



