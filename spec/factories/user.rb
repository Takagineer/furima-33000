FactoryBot.define do
  factory :user do
    nickname              {"なかちゃん"}
    email                 {"tanak@tanaka"}
    password              {"tanaka10"}
    password_confirmation {password}
    family_name           {"田中"}
    last_name             {"田仲"}
    family_name_kana      {"タナカ"}
    last_name_kana        {"タナカ"}
    birthday              {"19300101"}

  end
end