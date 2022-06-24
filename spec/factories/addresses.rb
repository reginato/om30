FactoryBot.define do
  factory :address do
    cep { "MyString" }
    street { "MyString" }
    complement { "MyString" }
    city { "MyString" }
    uf { "MyString" }
    ibge_code { "MyString" }
    neighborhood { "MyString" }
  end
end
