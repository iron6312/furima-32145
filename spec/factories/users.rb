FactoryBot.define do
  factory :user do
    first_name            { 'あああ' }
    first_name_kana       { 'カタカナ' }
    last_name             { 'あああ' }
    last_name_kana        { 'カタカナ' }
    nickname              { 'koike' }
    birthday              { '2000-01-01' }
    email                 { 'kkk@gmail.com' }
    password              { '000000' }
    password_confirmation { '000000' }
  end
end
