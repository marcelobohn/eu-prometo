FactoryGirl.define do
  factory :user do
    name "admin"
    email 'admin@euprometoavoce.com.br'
    password '123123'
    password_confirmation '123123'
  end
end