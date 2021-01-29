class OrdersController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
    @purchase_orders = Item.find(params[:item_id])
  end


  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
     if @purchase_order.valid?
          @purchase_order.save
          redirect_to root_path
     else
      @purchase_orders = Item.find(params[:item_id])
      render :index
     end
  end

  private
   def purchase_order_params
    params.require(:purchase_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: Item.find(params[:item_id]).id, token: params[:token])
  end
end

