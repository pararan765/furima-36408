class PayPost
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :adress, :building, :user_id ,:item_id, :telephone_number
  with_options presence: true do
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :adress
    validates :telephone_number, format:{with: /\A[0-9]{10,11}\z/}
    validates :token
  end

  def save
    pay = Pay.create( user_id: user_id, item_id: item_id)

    Post.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, adress: adress, building: building, telephone_number: telephone_number, pay_id: pay.id)
  end
end