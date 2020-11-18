class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_deli = OrderDeli.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_deli = OrderDeli.new(order_params)
    if @order_deli.valid?
      @order_deli.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  
  
  def order_params
    params.require(:order_deli).permit(:postal, :city, :banchi, :bill, :phone, :send_area_id).merge(user_id: current_user.id, item_id: params[:item_id])
  #:price
  #token: params[:token]
  end


end
