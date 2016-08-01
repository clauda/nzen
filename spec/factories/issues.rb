FactoryGirl.define do
  factory :issue, class: 'Issue' do
    reason "MyString"
    message "MyText"
    status "MyString"
    name "MyString"
    email "MyString"
    service
  end
end
