*** Settings ***
Resource    PO/MenuPage.robot
Resource    PO/Cart.robot


*** Keywords ***
User navigates To Coffee Cart Website
    MenuPage.Load
User Lands On The Menu Page
    MenuPage.Verify Page Loaded

User Should See Coffee Menu
    MenuPage.Verify First And Last Coffees Listed On Menu

Cart is Empty
    Cart.Verify Cart Is Empty