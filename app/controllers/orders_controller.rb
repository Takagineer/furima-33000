class OrdersController < ApplicationController
  before_action :move_to_index, only:[:index]
  before_action :authenticate_user!, only:[:index]
  before_action :order_generate, only:[:index, :create]

  def index
    @purchase_order = PurchaseOrder.new

  end


  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
      if @purchase_order.valid?
          pay_item
          @purchase_order.save
          redirect_to root_path
     else
          render :index
     end
  end

  private
   def purchase_order_params
    params.require(:purchase_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: Item.find(params[:item_id]).id, token: params[:token])
   end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
            amount: @purchase_orders.selling_price,
            card: purchase_order_params[:token],
            currency: 'jpy'
          )
    end

    def move_to_index
      if current_user == Item.find(params[:item_id]).user || Item.find(params[:item_id]).order.present?
        redirect_to root_path
        
    end

    def order_generate
      @purchase_orders = Item.find(params[:item_id])
    end

  end
end
