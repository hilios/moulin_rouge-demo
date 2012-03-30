Feature: Post
  In order to publish content
  As a blogger
  I want to create a post
  
  Background:
    Given the following posts exists:
      | title             | body                                                            |
      | Lorem ipsum dolor | Is simply dummy text of the printing and typesetting industry.  |
      
  Scenario: Reading a post
    When I am on the homepage
    Then show me the page
    And I should see "Lorem ipsum dolor"
    And I should see "Is simply dummy text of the printing and typesetting industry."

  Scenario: Searching a post
    
  Scenario: Authorizing user
    When I am on the homepage
  
  Scenario: Creating a post
    
  
  Scenario: Updating a post
    
    