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

User Adds Coffees To Cart
    [Arguments]    @{order_list}
    Set Test Variable    ${count}    ${0}
    Set Test Variable    ${total_price}    ${0}
    FOR    ${coffee}    IN    @{order_list}
        ${new_count}    Evaluate    ${count} + 1
        Set Test Variable    ${count}    ${new_count}
        MenuPage.Add ${coffee} To Cart
        ${price}=    Get ${coffee} Price
        ${new_total_price}    Evaluate    ${total_price} + ${price}
        Set Test Variable    ${total_price}    ${new_total_price}
    END

Coffees are Added To Cart
    [Arguments]    @{order_list}
    FOR    ${coffee}    IN    @{order_list}
        MenuPage.Verify ${coffee} Added To Cart From Menu Page With ${total_price} And ${count}
        Cart.Verify ${coffee} Added To Cart From Cart Page With ${total_price} And ${count}
    END
Get ${coffee} Price
    ${coffee_list} =    Load JSON From File    Data/coffee.json
    FOR    ${element}    IN    @{coffee_list}
        ${check}=    Evaluate    '${element}[name]' == '${coffee}'
        IF    '${check}' == 'True'    BREAK
    END
    RETURN    ${element}[price]