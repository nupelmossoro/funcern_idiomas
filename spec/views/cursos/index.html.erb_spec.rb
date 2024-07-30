require 'rails_helper'

RSpec.describe "cursos/index", type: :view do
  before(:each) do
    assign(:cursos, [
      Curso.create!(
        idioma: "Idioma",
        nivel: 2,
        dia: "Dia",
        turno: "Turno"
      ),
      Curso.create!(
        idioma: "Idioma",
        nivel: 2,
        dia: "Dia",
        turno: "Turno"
      )
    ])
  end

  it "renders a list of cursos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Idioma".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dia".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Turno".to_s), count: 2
  end
end
