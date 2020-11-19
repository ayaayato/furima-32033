FactoryBot.define do
  factory :order_deli do

    postal            {"1234-56"}
    city              {"市区町村"}
    banchi            {"100番地"}
    bill              {"ビル"}
    send_area_id      {2}
    phone             {"090123456"}
    user_id           {1}
    item_id           {1}
    token             {"tok_abcdefghijk00000000000000000"}
    price             {1111}
    
  end
end