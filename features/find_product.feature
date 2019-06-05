Feature: Find a product on Amazon.de

@general @testone
Scenario: Find the product
    Given Amazon.de is opened
    When I search for iPhone XS 128gb
    And I click on it to open its page
    Then I should see all information about my product

@general @testtwo
Scenario: Put the product in the cart
    Given Amazon.de is opened
    When I search for iPhone XS 128gb
    And I click on it to open its page
    And I add it to the shopping cart
    Then I should see the product in the cart

@general @testtree
Scenario: Remove the product from the cart
    Given Amazon.de is opened
    When I search for iPhone XS 128gb
    And I click on it to open its page
    And I add it to the shopping cart
    And I remove our product from the cart
    Then I should see the cart empty

@general @testfour
Scenario: Select different characteristics of the product
    Given Amazon.de is opened
    When I search for iPhone XS 128gb
    And I click on it to open its page
    And I change the memory option to 256gb
    And I change the color to black
    Then I should see both options selected
