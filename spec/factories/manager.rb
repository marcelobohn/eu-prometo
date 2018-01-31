FactoryBot.define do
  factory :manager do
    name 'Maria'
    trait :mayor do
        type_manager :mayor
    end
  end
end