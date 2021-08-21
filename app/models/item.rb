class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :concept
    with_options numericality: { other_than: 1 } do
     validates :category_id
     validates :state_id
     validates :delivery_id
     validates :prefecture_id
     validates :shipping_id
    end
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: "半角数値のみ使用してください" }
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :state
  belongs_to :delivery
  belongs_to :shipping

end
