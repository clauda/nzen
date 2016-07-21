require 'rails_helper'

RSpec.describe "districts/index", type: :view do
  before(:each) do
    assign(:districts, [
      District.create!(name: FFaker::Name.name),
      District.create!(name: FFaker::Name.name)
    ])
  end

  it "renders a list of districts" do
    render
    assert_select "tr>td", :minimum => 2
  end
end
