FactoryBot.define do
  factory :purchase_order do


    postal_code        {"123-4567"}
    prefecture_id      {18}
    city               {"東京都"}
    address            {"新宿区"}
    building_name      {"柳ビル"}
    phone_number       {"09012345678"}
    order_id           {90}
    user_id            {120}
    item_id            {150}
    
  end
end
