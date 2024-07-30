require 'rails_helper'

RSpec.describe "enderecos/index", type: :view do
  before(:each) do
    assign(:enderecos, [
      Endereco.create!(
        cep: "Cep",
        logradouro: "Logradouro",
        numero: "Numero",
        bairro: "Bairro",
        estado: nil,
        cidade: nil
      ),
      Endereco.create!(
        cep: "Cep",
        logradouro: "Logradouro",
        numero: "Numero",
        bairro: "Bairro",
        estado: nil,
        cidade: nil
      )
    ])
  end

  it "renders a list of enderecos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cep".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Logradouro".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Numero".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Bairro".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
