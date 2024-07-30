require 'rails_helper'

RSpec.describe "enderecos/new", type: :view do
  before(:each) do
    assign(:endereco, Endereco.new(
      cep: "MyString",
      logradouro: "MyString",
      numero: "MyString",
      bairro: "MyString",
      estado: nil,
      cidade: nil
    ))
  end

  it "renders new endereco form" do
    render

    assert_select "form[action=?][method=?]", enderecos_path, "post" do

      assert_select "input[name=?]", "endereco[cep]"

      assert_select "input[name=?]", "endereco[logradouro]"

      assert_select "input[name=?]", "endereco[numero]"

      assert_select "input[name=?]", "endereco[bairro]"

      assert_select "input[name=?]", "endereco[estado_id]"

      assert_select "input[name=?]", "endereco[cidade_id]"
    end
  end
end
