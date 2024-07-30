require 'rails_helper'

RSpec.describe "enderecos/edit", type: :view do
  let(:endereco) {
    Endereco.create!(
      cep: "MyString",
      logradouro: "MyString",
      numero: "MyString",
      bairro: "MyString",
      estado: nil,
      cidade: nil
    )
  }

  before(:each) do
    assign(:endereco, endereco)
  end

  it "renders the edit endereco form" do
    render

    assert_select "form[action=?][method=?]", endereco_path(endereco), "post" do

      assert_select "input[name=?]", "endereco[cep]"

      assert_select "input[name=?]", "endereco[logradouro]"

      assert_select "input[name=?]", "endereco[numero]"

      assert_select "input[name=?]", "endereco[bairro]"

      assert_select "input[name=?]", "endereco[estado_id]"

      assert_select "input[name=?]", "endereco[cidade_id]"
    end
  end
end
