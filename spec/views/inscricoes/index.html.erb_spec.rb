require 'rails_helper'

RSpec.describe "inscricoes/index", type: :view do
  before(:each) do
    assign(:inscricoes, [
      Inscricao.create!(
        nome: "Nome",
        sexo: "Sexo",
        data_nascimento: "Data Nascimento",
        cidade: "Cidade",
        nome_pai: "Nome Pai",
        nome_mae: "Nome Mae",
        rg: "Rg",
        cpf: "Cpf",
        orgao_expedidor: "Orgao Expedidor",
        celular: "Celular",
        telefone: "Telefone",
        residencial: "Residencial",
        forma_pagamento: "Forma Pagamento",
        secretaria: "Secretaria",
        observacao: "Observacao"
      ),
      Inscricao.create!(
        nome: "Nome",
        sexo: "Sexo",
        data_nascimento: "Data Nascimento",
        cidade: "Cidade",
        nome_pai: "Nome Pai",
        nome_mae: "Nome Mae",
        rg: "Rg",
        cpf: "Cpf",
        orgao_expedidor: "Orgao Expedidor",
        celular: "Celular",
        telefone: "Telefone",
        residencial: "Residencial",
        forma_pagamento: "Forma Pagamento",
        secretaria: "Secretaria",
        observacao: "Observacao"
      )
    ])
  end

  it "renders a list of inscricoes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sexo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Data Nascimento".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cidade".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome Pai".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome Mae".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Rg".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Orgao Expedidor".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Celular".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Telefone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Residencial".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Forma Pagamento".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Secretaria".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Observacao".to_s), count: 2
  end
end
