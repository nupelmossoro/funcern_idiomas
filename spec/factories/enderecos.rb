FactoryBot.define do
  factory :endereco do
    cep { "MyString" }
    logradouro { "MyString" }
    numero { "MyString" }
    bairro { "MyString" }
    deleted_at { "2024-03-26 23:06:34" }
    estado { nil }
    cidade { nil }
  end
end
