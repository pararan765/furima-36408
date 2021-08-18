class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :concept
    validates :category_id
    validates :state_id
    validates :delivery_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end

  belongs_to :user
  has_one_attached :image
end
