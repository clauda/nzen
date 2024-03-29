require 'rails_helper'

RSpec.describe "admin/districts/edit", type: :view do
  let(:city) { FactoryGirl.create :city }
  before(:each) do
    @district = assign(:district, District.create!(
      :name => "MyString",
      :city => city,
      :permalink => "MyString"
    ))
  end

  it "renders the edit district form" do
    render

    assert_select "form[action=?][method=?]", admin_district_path(@district), "post" do

      assert_select "input#district_name[name=?]", "district[name]"

    end
  end
end
