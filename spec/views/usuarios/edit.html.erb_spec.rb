require 'rails_helper'

RSpec.describe "usuarios/edit", type: :view do
  let(:usuario) {
    Usuario.create!(
      email: "MyString"
    )
  }

  before(:each) do
    assign(:usuario, usuario)
  end

  it "renders the edit usuario form" do
    render

    assert_select "form[action=?][method=?]", usuario_path(usuario), "post" do

      assert_select "input[name=?]", "usuario[email]"
    end
  end
end
