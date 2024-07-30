require 'rails_helper'

RSpec.describe "estados/show", type: :view do
  before(:each) do
    assign(:estado, Estado.create!(
      nome: "Nome",
      sigla: "Sigla"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Sigla/)
  end
end
