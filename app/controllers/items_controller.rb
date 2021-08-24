class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit ,:create , :update]
  before_action :item_deta, only: [:show, :edit, :update]
  before_action :item_deta, only: [:edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
     else
       render :edit
     end

  private

  def item_params
     params.require(:item).permit(:name, :image, :concept, :category_id, :state_id, :delivery_id, :prefecture_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def item_deta
    @item = Item.find(params[:id])
  end

  def id_check
    unless current_user.id == @item.user_id 
      redirect_to root_path
    end 
  end
  end
end
