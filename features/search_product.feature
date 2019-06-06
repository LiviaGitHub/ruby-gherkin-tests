Feature: Search a product on Amazon.de

Background:
  Given Amazon.de is opened
  When I search for iPhone XS 128gb
  And I click on it to open its page

@general
Scenario: Find the product
    Then I should see all information about my product

@general
Scenario: Put the product in the cart
    And I add it to the shopping cart
    Then I should see the product in the cart

@general
Scenario: Remove the product from the cart
    And I add it to the shopping cart
    And I remove our product from the cart
    Then I should see the cart empty

@general
Scenario: Select different characteristics of the product
    And I change the memory option to 256gb
    And I change the color to black
    Then I should see both options selected
