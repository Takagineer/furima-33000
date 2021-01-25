class OrdersController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
  end
end
