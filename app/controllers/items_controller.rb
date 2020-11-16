class ItemsController < ApplicationController

  def index 
  end

  def new
    @item = Item.new
  end
  

  private

  def item_params
    params.require(:item).permit(:title, :explan, :image, :price, :category_id, :send_area_id, :status_id, :send_fee_id, :send_day_id ).merge(user_id: current_user.id)
  end
end
