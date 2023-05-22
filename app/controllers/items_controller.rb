class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :edit]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if @item.update(item_params)
      redirect_to item_path
    else
      @item.update(item_params)
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :data, :category_id, :price, :condition_id, :postage_id, :state_id,
                                 :shipping_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    return if user_signed_in? && current_user.id == Item.find(params[:id]).user_id

    redirect_to action: :index
  end
end
