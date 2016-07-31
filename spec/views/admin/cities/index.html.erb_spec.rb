require 'rails_helper'

RSpec.describe "admin/cities/index", type: :view do
  before(:each) do
    assign(:cities, [
      City.create!(
        :name => "Name3",
        :state => "State",
        :published => true,
        :permalink => "name-3"
      ),
      City.create!(
        :name => "Name1",
        :state => "State2",
        :published => true,
        :permalink => "name-1"
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "Name3".to_s, :count => 1
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end
