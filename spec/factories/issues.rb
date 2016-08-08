FactoryGirl.define do
  factory :issue, class: 'Issue' do
    reason "mistake"
    message "Lorem Ipsum"
    status "new"
    name "Claudia"
    email "claudia@pinou.com.br"
    service
  end
end
