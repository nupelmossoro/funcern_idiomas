require 'rails_helper'

RSpec.describe "cidades/new", type: :view do
  before(:each) do
    assign(:cidade, Cidade.new(
      nome: "MyString",
      estado: nil
    ))
  end

  it "renders new cidade form" do
    render

    assert_select "form[action=?][method=?]", cidades_path, "post" do

      assert_select "input[name=?]", "cidade[nome]"

      assert_select "input[name=?]", "cidade[estado_id]"
    end
  end
end
