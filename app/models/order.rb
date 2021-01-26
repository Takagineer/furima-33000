class Order < ApplicationRecord
  has_one :order
  has_one :purchase
end
