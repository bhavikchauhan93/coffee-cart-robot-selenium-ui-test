*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${EMPTY_CART}                     //a[@aria-label='Cart page' and text()='cart (0)']
${CHECKOUT_BUTTON_ZERO_AMOUNT}    //button[@aria-label='Proceed to checkout' and text()='Total: $0.00']


*** Keywords ***
Verify Cart Is Empty
    Page Should Contain Element    ${EMPTY_CART}
    Page Should Contain Element    ${CHECKOUT_BUTTON_ZERO_AMOUNT}