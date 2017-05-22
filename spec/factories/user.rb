FactoryGirl.define do
  factory :user do
    name "normal"
    email 'normal@euprometoavoce.com.br'
    password '123123'
    password_confirmation '123123'
    trait :admin do
      name "admin"
      email 'admin@euprometoavoce.com.br'
      admin true
    end
  end
end
