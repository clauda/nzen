require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  describe do
    let(:category){ FactoryGirl.create(:category) }
    before(:each) do
      category.reindex
      assign(:categories, Category.search('*', per_page: 1))
    end

    it "renders a list of categories" do
      render
      assert_select "tr>td", :minimum => 1
    end
  end
end
