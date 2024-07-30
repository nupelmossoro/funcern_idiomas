require 'rails_helper'

RSpec.describe "estados/new", type: :view do
  before(:each) do
    assign(:estado, Estado.new(
      nome: "MyString",
      sigla: "MyString"
    ))
  end

  it "renders new estado form" do
    render

    assert_select "form[action=?][method=?]", estados_path, "post" do

      assert_select "input[name=?]", "estado[nome]"

      assert_select "input[name=?]", "estado[sigla]"
    end
  end
end
