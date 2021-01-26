class OrdersController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
  end


  def create
    binding.pry
  end
end
