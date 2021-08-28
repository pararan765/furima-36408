class PaysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :only]
  before_action :item_data, only: [:index, :create]

  def index
    @pay_post = PayPost.new
    if current_user.id == @item.user_id 
      redirect_to root_path
    elsif @item.pay.present? 
      redirect_to root_path
    end
  end

  def create
    @pay_post = PayPost.new(pay_params)
    if @pay_post.valid?
       pay_item
       @pay_post.save
       return redirect_to root_path
    end 
     render :index
  end

  private

  def pay_params
    params.require(:pay_post).permit(:postal_code, :prefecture_id, :city, :adress, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: pay_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def item_data
    @item = Item.find(params[:item_id])
  end
end
