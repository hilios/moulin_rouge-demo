FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    password "1234"
    password_confirmation "1234"
    
    factory :admin do
      roles { [Role.find_or_create_by_name(:admin)] }
    end
  end
  
  factory :role do
    sequence(:name) { |n| "name#{n}" }
  end
end