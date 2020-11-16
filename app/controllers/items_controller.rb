class ItemsController < ApplicationController

  def index 
    @item = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def create
    @items = Item.new(item_params)
   if @items.save
    redirect_to root_path
   else
   render :new
   end
  end
  

  private

  def item_params
    params.require(:item).permit(:title, :explan, :image, :price, :category_id, :send_area_id, :status_id, :send_fee_id, :send_day_id ).merge(user_id: current_user.id)
  end
end
