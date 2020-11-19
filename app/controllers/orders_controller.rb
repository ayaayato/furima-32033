class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]



  def index
    find_item
    move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_deli = OrderDeli.new
  end

  def create
    find_item
    @order_deli = OrderDeli.new(order_params)
    if @order_deli.valid?
      pay_item
      @order_deli.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:order_deli).permit(:postal, :city, :banchi, :bill, :phone, :send_area_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
    
  def move_to_index
    unless @item.order == nil 
      redirect_to root_path
    end
  end

end
