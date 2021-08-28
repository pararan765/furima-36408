FactoryBot.define do
  factory :pay_post do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"861-4137"}
    prefecture_id {2}
    city   {"松江市"}
    adress   {"5-4"}
    building  {"あああ"}
    telephone_number {"08023567823"}
    user_id  {6}
    item_id {2}
  end
end