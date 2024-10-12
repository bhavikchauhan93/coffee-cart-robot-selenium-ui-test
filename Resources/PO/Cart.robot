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

Navigate to Cart
    Click Element    ${CART}
Verify ${coffee} Added To Cart From Cart Page With ${price}
    Navigate to Cart
    Wait Until Page Contains Element    //ul//li[@class='list-item']/div[text()='${coffee}']
    Page Should Contain Element         //ul//li[@class='list-item']/div[text()='Mocha']/following-sibling::div[text()='$${price}.00']
    Page Should Contain Button          Total: $${price}.00