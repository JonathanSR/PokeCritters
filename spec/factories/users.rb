FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Jonathan#{n}" }
    sequence(:last_name)  { |n|"Serrano#{n}" }
    sequence(:email) { |n|"test#{n}@google.com" }
    sequence(:username) { |n|"user#{n}" }
    password "password"
  end
end