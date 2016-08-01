require 'rails_helper'

RSpec.describe "admin/issues/new", type: :view do
  before(:each) do
    assign(:issue, Issue.new(
      :reason => "MyString",
      :message => "MyText",
      :status => "MyString",
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new admin_issue form" do
    render

    assert_select "form[action=?][method=?]", admin_issues_path, "post" do

      assert_select "select#issue_reason[name=?]", "issue[reason]"

      assert_select "textarea#issue_message[name=?]", "issue[message]"

      assert_select "select#issue_status[name=?]", "issue[status]"

      assert_select "input#issue_name[name=?]", "issue[name]"

      assert_select "input#issue_email[name=?]", "issue[email]"
    end
  end
end
