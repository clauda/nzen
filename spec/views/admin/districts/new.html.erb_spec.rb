require 'rails_helper'

RSpec.describe "admin/districts/new", type: :view do
  before(:each) do
    assign(:district, District.new(
      :name => "MyString",
      :permalink => "MyString"
    ))
  end

  it "renders new district form" do
    render

    assert_select "form[action=?][method=?]", admin_districts_path, "post" do

      assert_select "input#district_name[name=?]", "district[name]"

    end
  end
end
