require 'rails_helper'

RSpec.describe "admin/districts/index", type: :view do
  let(:city) { FactoryGirl.create :city }
  before(:each) do
    assign(:districts, [
      District.create!(name: FFaker::Name.name, city: city),
      District.create!(name: FFaker::Name.name, city: city)
    ])
  end

  it "renders a list of districts" do
    render
    assert_select "tr>td", :minimum => 2
  end
end
