require 'rails_helper'

RSpec.describe "cursos/show", type: :view do
  before(:each) do
    assign(:curso, Curso.create!(
      idioma: "Idioma",
      nivel: 2,
      dia: "Dia",
      turno: "Turno"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Idioma/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Dia/)
    expect(rendered).to match(/Turno/)
  end
end
