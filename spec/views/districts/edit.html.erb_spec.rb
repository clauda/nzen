require 'rails_helper'

RSpec.describe "districts/edit", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :name => "MyString",
      :permalink => "MyString"
    ))
  end

  it "renders the edit district form" do
    render

    assert_select "form[action=?][method=?]", district_path(@district), "post" do

      assert_select "input#district_name[name=?]", "district[name]"

    end
  end
end
