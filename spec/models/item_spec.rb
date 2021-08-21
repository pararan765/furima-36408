require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる場合' do
      it '必要な情報を入力したら出品できます' do
        expect(@item).to be_valid
      end

    end

    context '商品出品ができない場合' do
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が空の場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空の場合登録できない９' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリーが’---’なら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態が’---’なら登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it '配送料の負担が’---’なら登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it '都道府県が’---’なら登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '配送日時が’---’なら登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end      

      it '価格が空白の場合、登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end      

      it '価格が２９９円以下の場合登録できない' do
        @item.category_id = 2
        @item.state_id = 2
        @item.delivery_id = 2
        @item.prefecture_id = 2
        @item.shipping_id = 2
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格は半角数値以外登録できない' do
        @item.category_id = 2
        @item.state_id = 2
        @item.delivery_id = 2
        @item.prefecture_id = 2
        @item.shipping_id = 2
        @item.price = "matsue"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '価格が半角英数混合では登録できない' do
        @item.price = "test666"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it  '価格が999999円を超えると登録できない' do
       @item.price = 10000000
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
  
end
