class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :create]
  before_action :exile_to_index, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  if @item.save
     redirect_to item_path(@item.id)
  else
   render :edit
  end
  end
  

  private

  def item_params
    params.require(:item).permit(:title, :explan, :image, :price, :category_id, :send_area_id, :status_id, :send_fee_id, :send_day_id ).merge(user_id: current_user.id)
  end
  
  def exile_to_index
    @item = Item.find_by(id:params[:id])
     unless @item.user_id == current_user.id
       redirect_to action: :index
     end
  end
  
end
