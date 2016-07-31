require 'rails_helper'

RSpec.describe "admin/cities/show", type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :name => "Name",
      :state => "State",
      :published => false,
      :permalink => "Permalink"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Permalink/)
  end
end
