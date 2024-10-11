*** Settings ***
Resource    PO/MenuPage.robot
Resource    PO/Cart.robot


*** Keywords ***
User Navigates To Coffee Cart Website
    MenuPage.Load
User Lands On The Menu Page
    MenuPage.Verify Page Loaded

User Should See Coffee Menu
    MenuPage.Verify First And Last Coffees Listed On Menu

Cart Is Empty
    Cart.Verify Cart Is Empty

User Clicks Menu Option
    MenuPage.Navigate To Menu
    
Full Coffee Menu Is Displayed
    MenuPage.Verify All Coffees Ingredients And Price On Menu