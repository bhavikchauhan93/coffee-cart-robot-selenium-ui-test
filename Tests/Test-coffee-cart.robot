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

User Adds Coffee to Cart
    [Tags]    add-to-cart    regression
    Given User Navigates To Coffee Cart Website
    When User Lands On The Menu Page
    #Embedded argument used. Replace coffee names to reuse keyword.
    And User Adds Mocha To Cart
    Then Item Mocha Is Added To Cart

    