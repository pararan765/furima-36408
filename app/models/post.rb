class Post < ApplicationRecord
  #with_options presence: true do
  #  validates :postal_code, format:{with: /\A\d{3}[-]?\d{4}\z/}
  #  validates :prefecture_id
  #  validates :city
  #  validates :adress
  #  validates :telephone_number, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{10,11}/}
    belongs_to :pay
end
