class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :concept
    validates :category_id
    validates :state_id
    validates :delivery_id
    validates :prefecture_id
    validates :shipping_id
    validates :price
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
