require 'rails_helper'

RSpec.describe "admin/cities/edit", type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :name => "MyString",
      :state => "State",
      :published => false,
      :permalink => "MyString"
    ))
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", admin_city_path(@city), "post" do
      assert_select "input#city_name[name=?]", "city[name]"
      assert_select "input#city_state[name=?]", "city[state]"
      assert_select "input#city_published[name=?]", "city[published]"
      assert_select "input#city_permalink[name=?]", "city[permalink]"
    end
  end
end
