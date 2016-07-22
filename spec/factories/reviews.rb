FactoryGirl.define do
  factory :review do
    comment "MyString"
    rating 5
    service
    user_id 1
  end
end
