FactoryGirl.define do
  factory :district do
    name FFaker::Name.name
    city
    permalink "link"
  end
end
