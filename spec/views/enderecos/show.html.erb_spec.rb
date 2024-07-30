require 'rails_helper'

RSpec.describe "enderecos/show", type: :view do
  before(:each) do
    assign(:endereco, Endereco.create!(
      cep: "Cep",
      logradouro: "Logradouro",
      numero: "Numero",
      bairro: "Bairro",
      estado: nil,
      cidade: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Logradouro/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
