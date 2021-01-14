class ItemsController < ApplicationController

  def index
  end

 def new
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
  params.require(:item).permit(:title,:explanation,:category_id,:status_id,:shipping_cost_id,:delivery_source_id,:preparation_day_id,:selling_price,:user_id)
 end
end
