require 'rails_helper'

RSpec.describe "admin/issues/show", type: :view do
  before(:each) do
    @admin_issue = assign(:issue, Issue.create!(
      :reason => "Reason",
      :message => "MyText",
      :status => "Status",
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Reason/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
