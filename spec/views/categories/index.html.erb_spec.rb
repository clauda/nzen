require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  describe do
    let(:category_name){ FFaker::Name.name }
    before(:each) do
      assign(:categories, [
        Category.create!(name: category_name),
        Category.create!(name: FFaker::Name.name, published: false)
      ])
    end

    it "renders a list of categories" do
      render
      assert_select "tr>td", :text => category_name, :count => 1
      assert_select "tr>td", :text => false.to_s, :count => 0
    end
  end
end
