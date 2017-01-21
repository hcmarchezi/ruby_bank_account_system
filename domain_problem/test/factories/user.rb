# This will guess the User class
FactoryGirl.define do

  sequence :email do |n|
    "abc#{n}@abc.com"
  end

  factory :user do
    name  "John Doe"
    email { generate :email }
  end
end