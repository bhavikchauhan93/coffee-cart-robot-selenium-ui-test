*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CART}                           //a[@aria-label='Cart page']
${EMPTY_CART}                     //a[@aria-label='Cart page' and text()='cart (0)']
${CHECKOUT_BUTTON_ZERO_AMOUNT}    //button[@aria-label='Proceed to checkout' and text()='Total: $0.00']

*** Keywords ***
Verify Cart Is Empty
    Page Should Contain Element    ${EMPTY_CART}
    Page Should Contain Element    ${CHECKOUT_BUTTON_ZERO_AMOUNT}
    Log    Cart is emtpy

Navigate to Cart
    Click Element    ${CART}

Verify ${coffee} Added To Cart From Cart Page With ${total_price} And ${count}
    Navigate to Cart
    Wait Until Page Contains Element    //a[@aria-label='Cart page' and text()='cart (${count})']
    Wait Until Page Contains Element    //ul//li[@class='list-item']/div[text()='${coffee}']
    Page Should Contain Button          Total: $${total_price}.00
    Log Many    ${coffee} added to cart
    ...    ${count} coffees added to cart
    ...    Total price of all coffees is $${total_price}

Verify ${coffee} Removed From Cart Page With Updated ${total_price} And ${count}
    Wait Until Page Contains Element    //a[@aria-label='Cart page' and text()='cart (${count})']
    Page Should Contain Button          Total: $${total_price}.00
    Page Should Not Contain Element     //ul//li[@class='list-item']/div[text()='${coffee}']
    Log Many    ${coffee} removed to cart
    ...    ${count} coffees remain in
    ...    Total price of all coffees is $${total_price}

Verify ${coffee} That Remain In Cart With ${TOTAL_PRICE}
    Page Should Contain Element     //ul//li[@class='list-item']/div[text()='${coffee}']
    Log    ${coffee} remains in cart