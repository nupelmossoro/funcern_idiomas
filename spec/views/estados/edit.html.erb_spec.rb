require 'rails_helper'

RSpec.describe "estados/edit", type: :view do
  let(:estado) {
    Estado.create!(
      nome: "MyString",
      sigla: "MyString"
    )
  }

  before(:each) do
    assign(:estado, estado)
  end

  it "renders the edit estado form" do
    render

    assert_select "form[action=?][method=?]", estado_path(estado), "post" do

      assert_select "input[name=?]", "estado[nome]"

      assert_select "input[name=?]", "estado[sigla]"
    end
  end
end
