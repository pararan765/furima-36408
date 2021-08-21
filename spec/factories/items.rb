FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.characters(number: 10) }
    concept           {Faker::Lorem.characters(number: 20) }
    price            {Faker::Lorem.characters(number: 4, min_numeric: 4) }
    category_id {2} 
    state_id  {2} 
    delivery_id {2} 
    prefecture_id {2} 
    shipping_id {2} 
    association :user
    after(:build) do |item| 
      item.image.attach(io:File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
