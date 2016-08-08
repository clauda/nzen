require 'rails_helper'

RSpec.describe "admin/issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(name: FFaker::Name.name, reason: "mistake", status: "new", email: FFaker::Internet.email),
      Issue.create!(name: FFaker::Name.name, reason: "mistake", status: "new", email: FFaker::Internet.email)
    ])
  end

  it "renders a list of admin/issues" do
    render
    assert_select "tr>td", :text => /^PIN/, :minimum => 2
    assert_select "tr>td", :text => "Erro nas informações".to_s, :minimum => 2
    assert_select "tr>td", :text => "Novo".to_s, :minimum => 2
  end
end
