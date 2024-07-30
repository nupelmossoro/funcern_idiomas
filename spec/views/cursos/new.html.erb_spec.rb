require 'rails_helper'

RSpec.describe "cursos/new", type: :view do
  before(:each) do
    assign(:curso, Curso.new(
      idioma: "MyString",
      nivel: 1,
      dia: "MyString",
      turno: "MyString"
    ))
  end

  it "renders new curso form" do
    render

    assert_select "form[action=?][method=?]", cursos_path, "post" do

      assert_select "input[name=?]", "curso[idioma]"

      assert_select "input[name=?]", "curso[nivel]"

      assert_select "input[name=?]", "curso[dia]"

      assert_select "input[name=?]", "curso[turno]"
    end
  end
end
