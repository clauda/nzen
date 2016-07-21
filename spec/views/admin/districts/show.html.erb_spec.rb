require 'rails_helper'

RSpec.describe "admin/districts/show", type: :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :name => "Name",
      :permalink => "Permalink"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Permalink/)
  end
end
