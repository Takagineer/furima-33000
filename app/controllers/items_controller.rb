class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_generate,only:[:show, :edit, :update]
  before_action :move_to_index,only:[:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

 def new
  @item = Item.new
 end
 
 def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end

 def show
 end

 def edit
 end

 def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
 end

 private 
 def item_params
  params.require(:item).permit(:title,:explanation,:category_id,:status_id,:shipping_cost_id,:delivery_source_id,:preparation_day_id,:selling_price, :image).merge(user_id: current_user.id)
 end

 def item_generate
  @item = Item.find(params[:id])
 end

<<<<<<< Updated upstream
 def move_to_index
  unless current_user == @item.user
    redirect_to root_path    
=======
  def move_to_index
    if current_user != @item.user || @item.order.present?
       redirect_to root_path
    end
>>>>>>> Stashed changes
  end
 end
end
