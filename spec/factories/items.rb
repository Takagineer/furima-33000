FactoryBot.define do
  factory :item do
    
    title                 {"ベルト"}
    explanation           {"このベルトはバンダム級王者に送られるベルトです"}
    category_id           {"3"}
    status_id             {"2"}
    shipping_cost_id      {"2"}
    delivery_source_id    {"14"}
    preparation_day_id    {"2"}
    selling_price         {"50000"}
    user_id               {"100"}
  end
end
