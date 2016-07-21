require 'rails_helper'

RSpec.describe "admin/categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :name => "MyString",
      :published => false
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", admin_categories_path, "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_published[name=?]", "category[published]"
    end
  end
end
