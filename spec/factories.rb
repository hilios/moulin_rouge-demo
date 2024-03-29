FactoryGirl.define do
  factory :user do
    name                  Forgery::Name.full_name
    sequence(:username)   { |n| "username#{n}" }
    password              Forgery::Basic.password
    password_confirmation { password }
    role
    
    factory :admin do
      role Role.find_or_create_by_name(:admin)
    end
    
    factory :editor do
      role Role.find_or_create_by_name(:editor)
    end
    
    factory :writer do
      role Role.find_or_create_by_name(:writer)
    end
  end
  
  factory :role do
    sequence(:name) { |n| "name#{n}" }
  end
  
  factory :post do
    user
    title       Forgery::LoremIpsum.words(6, :random => 250)
    body        Forgery::LoremIpsum.paragraphs(5, :random => 50)
    approved    true
    
    factory :unapproved_post do
      approved false
    end
  end
  
  factory :comment do
    post
    sequence(:from) { |n| "comment#{n}" }
    message         Forgery::LoremIpsum.words(100, :random => 50)
    approved        true
    
    factory :unapproved_comment do
      approved      true
    end
  end
end