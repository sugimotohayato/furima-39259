class OrdersController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OederAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end

private

def order_params
  params.require(:order_address).permit(:postcode, :state_id, :city, :address, :building, :tel)
        .merge(user_id: current_user.id,item_id: params[:item_id],order_id: order_id)
end

end