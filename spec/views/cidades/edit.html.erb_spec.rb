require 'rails_helper'

RSpec.describe "cidades/edit", type: :view do
  let(:cidade) {
    Cidade.create!(
      nome: "MyString",
      estado: nil
    )
  }

  before(:each) do
    assign(:cidade, cidade)
  end

  it "renders the edit cidade form" do
    render

    assert_select "form[action=?][method=?]", cidade_path(cidade), "post" do

      assert_select "input[name=?]", "cidade[nome]"

      assert_select "input[name=?]", "cidade[estado_id]"
    end
  end
end
