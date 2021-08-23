class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order("items.created_at DESC")
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
     params.require(:item).permit(:name, :image, :concept, :category_id, :state_id, :delivery_id, :prefecture_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

end
