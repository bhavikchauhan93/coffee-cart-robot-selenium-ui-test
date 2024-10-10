*** Settings ***
Documentation  These test cases are written in Gherkin format.
...    Use the following command to run tests:
...    robot -d Results Tests/Test-coffee-cart.robot

Resource  ../Resources/Base.robot    #Includes Test Setup and Test Teardown keywords
Resource  ../Resources/CoffeeCart.robot    #Includes keywords used in Test Cases

Test Setup        Begin Web Test
Test Teardown     End Web Test


*** Test Cases ***
User Opens Coffee Cart Website
    Given User navigates To Coffee Cart Website
    When User Lands On The Menu Page
    Then User Should See Coffee Menu
    And Cart is Empty