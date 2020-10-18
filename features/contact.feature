Feature: Contact
  I want to see the contact page
  and be able to contact through the form

  Scenario: View contact page
    Given I am on the contact page
    Then I should see 'Contact Us'

  Scenario: Contact
    Given I am on the contact page
    Then I'm able to contact through the form
