*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COFFEE_CART_URL}    https://coffee-cart.app/
${MENU_LABEL}         css:a[aria-label='Menu page']
${COFFEE_APP}         css:div[id='app']
${FIRST_MENU_ITEM}    //ul//li[1]//h4[text()='Espresso ']
${LAST_MENU_ITEM}     //ul//li[9]//h4[text()='Cafe Breve ']


*** Keywords ***
Load
    Go To    ${COFFEE_CART_URL}

Verify Page Loaded
    Wait Until Page Contains Element    ${MENU_LABEL}
    Wait Until Page Contains Element    ${COFFEE_APP}

Verify First And Last Coffees Listed On Menu
    Page Should Contain Element    ${FIRST_MENU_ITEM}
    Page Should Contain Element    ${LAST_MENU_ITEM}