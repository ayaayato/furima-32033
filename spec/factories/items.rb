FactoryBot.define do
  factory :item do

    after(:build) do |items|
      items.image.attach(io: File.open('/Users/sakaki/public/images/test_image.png'), filename: 'test_image.png')
    end
    
    title                  {"タイトル"}
    explan                 {"説明"}
    category_id            {2}
    status_id              {2}
    send_area_id           {2}
    send_fee_id            {2}
    send_day_id            {2}
    price                  {500}
    association :user
  end
end
