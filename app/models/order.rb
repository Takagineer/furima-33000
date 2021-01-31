class Order < ApplicationRecord
  has_one :user
  has_one :item
  has_one :purchase
end
