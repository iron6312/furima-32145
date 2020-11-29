FactoryBot.define do
  factory :item do
    image          { 1 }
    name           { 'あああ' }
    description    { Faker::Lorem.sentence }
    category_id    { 1 }
    fee_id         { 1 }
    ship_form_id   { 1 }
    status_id      { 1 }
    day_to_ship_id { 1 }
    price          { '11111' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
