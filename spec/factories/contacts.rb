FactoryBot.define do
  factory :contact do
    name "Carlos"
    email "carlos@carlos.com"
    type_contact 1
    description "Olá teste de contato"
    user nil
    readed nil
  end
end
