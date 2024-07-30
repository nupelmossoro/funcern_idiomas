require 'rails_helper'

RSpec.describe "cidades/index", type: :view do
  before(:each) do
    assign(:cidades, [
      Cidade.create!(
        nome: "Nome",
        estado: nil
      ),
      Cidade.create!(
        nome: "Nome",
        estado: nil
      )
    ])
  end

  it "renders a list of cidades" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
