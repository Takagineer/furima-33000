class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @item = Item.all
  end

 def new
  @item = Item.new.order("created_at DESC")
 end
 
 def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end

 private 
 def item_params
  params.require(:item).permit(:title,:explanation,:category_id,:status_id,:shipping_cost_id,:delivery_source_id,:preparation_day_id,:selling_price, :image).merge(user_id: current_user.id)
 end
end
