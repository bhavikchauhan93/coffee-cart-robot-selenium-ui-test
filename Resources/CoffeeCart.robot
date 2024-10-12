*** Settings ***
Resource    PO/MenuPage.robot
Resource    PO/Cart.robot

Library     JSONLibrary


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

User Adds ${coffee} To Cart
    MenuPage.Add ${coffee} To Cart

Item ${coffee} Is Added To Cart
    ${price}=    Get ${coffee} Price
    MenuPage.Verify ${coffee} Added To Cart From Menu Page With ${price}
    Cart.Verify ${coffee} Added To Cart From Cart Page With ${price}

Get ${coffee} Price
    ${coffee_list} =    Load JSON From File    Data/coffee.json
    FOR    ${element}    IN    @{coffee_list}
        ${check}=    Evaluate    '${element}[name]' == '${coffee}'
        IF    '${check}' == 'True'    BREAK
    END
    RETURN    ${element}[price]