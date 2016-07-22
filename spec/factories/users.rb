FactoryGirl.define do
  factory :user do
    name FFaker::Name.name
    email FFaker::Internet.email
    password '<3natalzen'
    role 'admin'
  end
end
