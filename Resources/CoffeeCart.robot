*** Settings ***
Resource    PO/MenuPage.robot
Resource    PO/Cart.robot

Library    JSONLibrary
Library    Collections


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
    [Arguments]    @{ORDER_LIST}
    Set Test Variable    ${COUNT}    ${0}                    #To count number of items in cart
    Set Test Variable    ${TOTAL_PRICE}    ${0}              #To calculate total price of items in cart
    Set Test Variable    @{ORDER_LIST}                       #To temporarily save list of items in cart, and use it for verifying items added
    FOR    ${coffee}    IN    @{ORDER_LIST}
        ${new_count}    Evaluate    ${COUNT} + 1
        Set Test Variable    ${COUNT}    ${new_count}        #Updating count of items in cart
        MenuPage.Add ${coffee} To Cart
        ${price}=    Get ${coffee} Price
        ${new_total_price}    Evaluate    ${TOTAL_PRICE} + ${price}
        Set Test Variable    ${TOTAL_PRICE}    ${new_total_price}        #Updating total price of items in cart
    END

Coffees Are Added To Cart
    #Verify from Menu Page
    FOR    ${coffee}    IN    @{ORDER_LIST}
        MenuPage.Verify ${coffee} Added To Cart From Menu Page With ${TOTAL_PRICE} And ${COUNT}
    END
    #Verify from Cart Page
    Navigate To Cart
    FOR    ${coffee}    IN    @{ORDER_LIST}
        Cart.Verify ${coffee} Added To Cart From Cart Page With ${TOTAL_PRICE} And ${COUNT}
    END

Get ${coffee} Price
    ${coffee_list} =    Load JSON From File    Data/coffee.json
    FOR    ${element}    IN    @{coffee_list}
        ${check}=    Evaluate    '${element}[name]' == '${coffee}'
        IF    '${check}' == 'True'    BREAK
    END
    RETURN    ${element}[price]

User Removes Coffee From Cart
    [Arguments]    @{REMOVAL_LIST}
    Set Test Variable    @{REMOVAL_LIST}                            #To temporarily save list of items to be removed from cart, and use it for verifying items removed
    Navigate To Menu
    FOR    ${coffee}    IN    @{REMOVAL_LIST}
        MenuPage.Remove ${coffee} From Cart With ${TOTAL_PRICE}
        Remove Values From List    ${ORDER_LIST}    ${coffee}        #Removes coffee from original order list
        ${new_count}    Evaluate    ${COUNT} - 1
        Set Test Variable    ${COUNT}    ${new_count}               #Updating count of items in cart
        ${price}=    Get ${coffee} Price
        ${new_total_price}    Evaluate    ${TOTAL_PRICE} - ${price}
        Set Test Variable    ${TOTAL_PRICE}    ${new_total_price}    #Updating total price of items in cart
    END

Coffees Are Removed From Cart
    #Verify removed coffees from Menu Page
    FOR    ${coffee}    IN    @{REMOVAL_LIST}
        MenuPage.Verify ${coffee} Removed From Menu Page With Updated ${TOTAL_PRICE} And ${COUNT}
    END
    #Verify remaining coffees in cart from Menu Page
    FOR    ${coffee}    IN    @{ORDER_LIST}
        MenuPage.Verify ${coffee} That Remain In Cart With ${TOTAL_PRICE}
    END

    #Verify removed coffees from Cart Page
    Navigate to Cart
    FOR    ${coffee}    IN    @{REMOVAL_LIST}
        Cart.Verify ${coffee} Removed From Cart Page With Updated ${TOTAL_PRICE} And ${COUNT}
    END
    #Verify remaining coffees in cart from Cart Page
    FOR    ${coffee}    IN    @{ORDER_LIST}
        Cart.Verify ${coffee} That Remain In Cart With ${TOTAL_PRICE}
    END

User Gets Notification For Discount On Extra Cup Of Mocha
    Navigate To Menu
    MenuPage.Show Promo Message

User Adds Discounted Mocha To Cart
    MenuPage.Accept Dicounted Mocha
    ${new_count}    Evaluate    ${COUNT} + 1
    Set Test Variable    ${COUNT}    ${new_count}                    #Updating count of items in cart
    ${price}=    Get (Discounted) Mocha Price
    ${new_total_price}    Evaluate    ${TOTAL_PRICE} + ${price}
    Set Test Variable    ${TOTAL_PRICE}    ${new_total_price}        #Updating total price of items in cart

Dicounted Mocha Is Added To Cart
    MenuPage.Verify (Discounted) Mocha Added To Cart From Menu Page With ${TOTAL_PRICE} And ${COUNT}
    Navigate to Cart
    Cart.Verify (Discounted) Mocha Added To Cart From Cart Page With ${TOTAL_PRICE} And ${COUNT}

User Continues To Chekout And Adds Details
    MenuPage.Navigate To Checkout And Adds Details With ${TOTAL_PRICE}
Order Is Placed
    MenuPage.Verify Order Is Placed