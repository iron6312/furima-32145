FactoryBot.define do
  factory :user_order do
    post_code      { '2343333' }
    ship_form_id   { 2 }
    city           { '香港' }
    address        { '北京' }
    phone_number   { '09876543210' }
  end
end
