class OrdersController < ApplicationController
  def index
    @purchase_order = PurchaseOrder.new
    @purchase_orders = Item.find(params[:item_id])
  end


  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_orders = Item.find(params[:item_id]) 
      if @purchase_order.valid?
        
       
        Payjp.api_key = "sk_test_82da72b8a39741439387a2d8"
        Payjp::Charge.create(
          amount: @purchase_orders.selling_price,
          card: purchase_order_params[:token],
          currency: 'jpy'
        )
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

