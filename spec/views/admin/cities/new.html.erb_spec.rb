require 'rails_helper'

RSpec.describe "admin/cities/new", type: :view do
  before(:each) do
    assign(:city, City.new(
      :name => "MyString",
      :state => "State",
      :published => false,
      :permalink => "MyString"
    ))
  end

  it "renders new city form" do
    render

    assert_select "form[action=?][method=?]", admin_cities_path, "post" do
      assert_select "input#city_name[name=?]", "city[name]"
      assert_select "input#city_state[name=?]", "city[state]"
      assert_select "input#city_published[name=?]", "city[published]"
      assert_select "input#city_permalink[name=?]", "city[permalink]"
    end
  end
end
