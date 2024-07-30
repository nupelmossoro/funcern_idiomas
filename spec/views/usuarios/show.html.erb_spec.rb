require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    assign(:usuario, Usuario.create!(
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
  end
end
