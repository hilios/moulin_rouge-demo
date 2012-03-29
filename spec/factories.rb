FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@host.com" }
    password "1234"
    password_confirmation "1234"
  end
  
  factory :role do
    sequence(:name) { |n| "name#{n}" }
  end
end