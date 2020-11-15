FactoryBot.define do
  factory :user do
    name                  {"りき1964"}
    email                 {Faker::Internet.free_email}
    password              {"konbanwa1"}
    password_confirmation {password}
    last_name             {"竹内"}
    first_name            {"力"}
    last_kana             {"タケウチ"}
    first_kana            {"リキ"}
    birthday              {"1964-01-04"}
  end
end