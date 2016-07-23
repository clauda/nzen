FactoryGirl.define do
  factory :review do
    comment "MyString"
    rating 5
    service
    user
  end
end
