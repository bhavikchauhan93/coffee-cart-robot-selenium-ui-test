*** Settings ***
Documentation  These test cases are written in Gherkin format.
...    Use the following command to run tests:
...    robot -d Results Tests/Test-coffee-cart.robot
...    robot -i regression -d Results Tests/Test-coffee-cart.robot
...    robot -i <tag-for-specific-test-cast> -d Results Tests/Test-coffee-cart.robot

Resource  ../Resources/Base.robot    #Includes Test Setup and Test Teardown keywords
Resource  ../Resources/CoffeeCart.robot    #Includes keywords used in Test Cases

Test Setup        Begin Web Test
Test Teardown     End Web Test


*** Test Cases ***
User Opens Coffee Cart Website
    [Tags]    app    regression
    Given User Navigates To Coffee Cart Website
    When User Lands On The Menu Page
    Then User Should See Coffee Menu
    And Cart Is Empty

User Can See Full Coffee Menu
    [Tags]    menu    regression
    Given User Navigates To Coffee Cart Website
    When User Clicks Menu Option
    Then User Lands On The Menu Page
    And Full Coffee Menu Is Displayed

User Adds One or More Coffee to Cart
    [Tags]    add-to-cart    regression
    [Documentation]    Can add one or more coffees to cart using same keywords.
    ...    Simply change coffee names passed as arguments to get different results.
    ...    Example:
    ...    And User Adds Coffees To Cart    Espresso Macchiato    Americano
    ...    Then Coffees are Added To Cart    Espresso Macchiato    Americano
    Given User Navigates To Coffee Cart Website
    When User Lands On The Menu Page
    And User Adds Coffees To Cart    Mocha    Espresso    Espresso Con Panna    Flat White
    Then Coffees are Added To Cart    Mocha    Espresso    Espresso Con Panna    Flat White