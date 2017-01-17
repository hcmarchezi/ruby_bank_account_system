puts "user.rb factories"

# This will guess the User class
FactoryGirl.define do

  sequence :name do |n|
    "John Number #{n}"
  end

  sequence :email do |n|
    "abc#{n}@abc.com"
  end

  factory :user do
    name  { generate :name  }
    email { generate :email }
  end
end