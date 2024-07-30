require 'rails_helper'

RSpec.describe "cidades/show", type: :view do
  before(:each) do
    assign(:cidade, Cidade.create!(
      nome: "Nome",
      estado: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
  end
end
