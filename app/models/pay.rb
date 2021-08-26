class Pay < ApplicationRecord
  belongs_to :user
  belongs_to :Item
  has_one    :post
end
