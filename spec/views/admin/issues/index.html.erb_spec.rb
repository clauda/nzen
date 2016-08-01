require 'rails_helper'

RSpec.describe "admin/issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        :reason => "Reason",
        :message => "MyText",
        :status => "Status",
        :name => "Name",
        :email => "Email"
      ),
      Issue.create!(
        :reason => "Reason",
        :message => "MyText",
        :status => "Status",
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of admin/issues" do
    render
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
