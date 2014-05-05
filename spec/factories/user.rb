require 'faker'

FactoryGirl.define  do
  factory :user do
    name "John"
    sequence(:email) { |n| "person#{n}@example.com"}
    password "helloworld"
    password_confirmation "helloworld"
  end
end