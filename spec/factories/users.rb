FactoryGirl.define do
  factory :user do
    sequence :first_name do |n|
      "Jonathan#{n}"
    end
    sequence :last_name do |n|
      "Serrano#{n}"
    end
    sequence :email do |n|
      "test#{n}@google.com"
    end
    sequence :username do |n|
      "user#{n}"
    end
    password: "password"
  end
end