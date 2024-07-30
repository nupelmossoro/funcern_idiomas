require 'rails_helper'

RSpec.describe "inscricoes/show", type: :view do
  before(:each) do
    assign(:inscricao, Inscricao.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Data Nascimento/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/Nome Pai/)
    expect(rendered).to match(/Nome Mae/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Orgao Expedidor/)
    expect(rendered).to match(/Celular/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Residencial/)
    expect(rendered).to match(/Forma Pagamento/)
    expect(rendered).to match(/Secretaria/)
    expect(rendered).to match(/Observacao/)
  end
end
