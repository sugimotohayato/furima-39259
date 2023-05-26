class OrdersController < ApplicationController
  before_action :move_to_sign_in, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    @orders = Order.where(item_id: @item.id)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    item_price = @item.price.to_i
    params.require(:order_address).permit(:postcode, :state_id, :city, :address, :building, :tel)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: item_price)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root_path
    item_id = params[:item_id]
    return unless current_user.id == Item.find(item_id).user_id || Order.exists?(item_id: item_id)

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
