Feature: Reviews
  I want to be able to upload reviews as excel file

  Scenario: Upload reviews
    Given I am on the admin dashboard page
    When I upload reviews through the 'Upload Reviews' button
    Then I should see success message
