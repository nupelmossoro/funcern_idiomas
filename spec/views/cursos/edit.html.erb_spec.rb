require 'rails_helper'

RSpec.describe "cursos/edit", type: :view do
  let(:curso) {
    Curso.create!(
      idioma: "MyString",
      nivel: 1,
      dia: "MyString",
      turno: "MyString"
    )
  }

  before(:each) do
    assign(:curso, curso)
  end

  it "renders the edit curso form" do
    render

    assert_select "form[action=?][method=?]", curso_path(curso), "post" do

      assert_select "input[name=?]", "curso[idioma]"

      assert_select "input[name=?]", "curso[nivel]"

      assert_select "input[name=?]", "curso[dia]"

      assert_select "input[name=?]", "curso[turno]"
    end
  end
end
