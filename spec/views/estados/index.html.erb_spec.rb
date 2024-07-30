require 'rails_helper'

RSpec.describe "estados/index", type: :view do
  before(:each) do
    assign(:estados, [
      Estado.create!(
        nome: "Nome",
        sigla: "Sigla"
      ),
      Estado.create!(
        nome: "Nome",
        sigla: "Sigla"
      )
    ])
  end

  it "renders a list of estados" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sigla".to_s), count: 2
  end
end
