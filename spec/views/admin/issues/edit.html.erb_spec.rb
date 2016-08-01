require 'rails_helper'

RSpec.describe "admin/issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :reason => "MyString",
      :message => "MyText",
      :status => "MyString",
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", admin_issue_path(@issue), "post" do

      assert_select "select#issue_reason[name=?]", "issue[reason]"

      assert_select "textarea#issue_message[name=?]", "issue[message]"

      assert_select "select#issue_status[name=?]", "issue[status]"

      assert_select "input#issue_name[name=?]", "issue[name]"

      assert_select "input#issue_email[name=?]", "issue[email]"
    end
  end
end
