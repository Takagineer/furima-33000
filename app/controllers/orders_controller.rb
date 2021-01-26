class OrdersController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
    @purchase_orders = Item.find(params[:item_id])
  end


  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
     if @purchase_order.save.valid?
          @purchase_order.save
          redirect_to action::index
     else
       render action::new
     end
  end

  private  
   def purchase_order_params
    params.require(:purchase_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end

