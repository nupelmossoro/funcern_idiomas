require 'rails_helper'

RSpec.describe "inscricoes/new", type: :view do
  before(:each) do
    assign(:inscricao, Inscricao.new(
      nome: "MyString",
      sexo: "MyString",
      data_nascimento: "MyString",
      cidade: "MyString",
      nome_pai: "MyString",
      nome_mae: "MyString",
      rg: "MyString",
      cpf: "MyString",
      orgao_expedidor: "MyString",
      celular: "MyString",
      telefone: "MyString",
      residencial: "MyString",
      forma_pagamento: "MyString",
      secretaria: "MyString",
      observacao: "MyString"
    ))
  end

  it "renders new inscricao form" do
    render

    assert_select "form[action=?][method=?]", inscricoes_path, "post" do

      assert_select "input[name=?]", "inscricao[nome]"

      assert_select "input[name=?]", "inscricao[sexo]"

      assert_select "input[name=?]", "inscricao[data_nascimento]"

      assert_select "input[name=?]", "inscricao[cidade]"

      assert_select "input[name=?]", "inscricao[nome_pai]"

      assert_select "input[name=?]", "inscricao[nome_mae]"

      assert_select "input[name=?]", "inscricao[rg]"

      assert_select "input[name=?]", "inscricao[cpf]"

      assert_select "input[name=?]", "inscricao[orgao_expedidor]"

      assert_select "input[name=?]", "inscricao[celular]"

      assert_select "input[name=?]", "inscricao[telefone]"

      assert_select "input[name=?]", "inscricao[residencial]"

      assert_select "input[name=?]", "inscricao[forma_pagamento]"

      assert_select "input[name=?]", "inscricao[secretaria]"

      assert_select "input[name=?]", "inscricao[observacao]"
    end
  end
end
