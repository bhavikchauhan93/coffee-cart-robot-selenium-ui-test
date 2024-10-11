*** Settings ***
Library    SeleniumLibrary

Resource    Locators/LC_MenuPage.robot
*** Variables ***
${COFFEE_CART_URL}         https://coffee-cart.app/
${MENU_LABEL}              css:a[aria-label='Menu page']
${COFFEE_APP}              css:div[id='app']


*** Keywords ***
Load
    Go To    ${COFFEE_CART_URL}

Verify Page Loaded
    Wait Until Page Contains Element    ${MENU_LABEL}
    Wait Until Page Contains Element    ${COFFEE_APP}

Verify First And Last Coffees Listed On Menu
    Page Should Contain Element    ${ESPRESSO}
    Page Should Contain Element    ${CAFE_BREVE}

Navigate To Menu
    Click Element    ${MENU_LABEL}

Verify All Coffees Ingredients And Price On Menu
    Verify Espresso
    Verify Espresso Macchiato
    Verify Cappuccino
    Verify Mocha
    Verify Flat White
    Verify Americano
    Verify Cafe Latte
    Verify Espresso Con Panna
    Verify Cafe Breve
    
Verify Espresso
    #Espresso = 30% espresso
    Page Should Contain Element    ${ESPRESSO}
    Page Should Contain Element    ${ESPRESSO_PRICE}
    Page Should Contain Element    ${ESPRESSO_CUP}
    Page Should Contain Element    ${ESPRESSO_INGREDIENT}

Verify Espresso Macchiato
    #Espresso Macchiato = 30% espresso + 15% milk foam
    Page Should Contain Element    ${ESPRESSO_MACCHIATO}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_PRICE}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_CUP}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_INGR}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_INGR_MF}

Verify Cappuccino
    #Cappuccino = 30% espresso + 20% steamed milk + 50% milk foam
    Page Should Contain Element    ${CAPPUCCINO}
    Page Should Contain Element    ${CAPPUCCINO_PRICE}
    Page Should Contain Element    ${CAPPUCCINO_CUP}
    Page Should Contain Element    ${CAPPUCCINO_INGR}
    Page Should Contain Element    ${CAPPUCCINO_INGR_SM}
    Page Should Contain Element    ${CAPPUCCINO_INGR_MF}

Verify Mocha
    #Mocha = 30% espresso + 20% chocolate syrup + 25% steamed milk + 25% whipped cream
    Page Should Contain Element    ${MOCHA}
    Page Should Contain Element    ${MOCHA_PRICE}
    Page Should Contain Element    ${MOCHA_CUP}
    Page Should Contain Element    ${MOCHA_INGR}
    Page Should Contain Element    ${MOCHA_INGR_CS}
    Page Should Contain Element    ${MOCHA_INGR_SM}
    Page Should Contain Element    ${MOCHA_INGR_WC}

Verify Flat White
    #Flat White = 30% espresso + 50% steamed milk
    Page Should Contain Element    ${FLAT_WHITE}
    Page Should Contain Element    ${FLAT_WHITE_PRICE}
    Page Should Contain Element    ${FLAT_WHITE_CUP}
    Page Should Contain Element    ${FLAT_WHITE_INGR}
    Page Should Contain Element    ${FLAT_WHITE_INGR_SM}

Verify Americano
    #Americano = 30% espresso + 70% water
    Page Should Contain Element    ${AMERICANO}
    Page Should Contain Element    ${AMERICANO_PRICE}
    Page Should Contain Element    ${AMERICANO_CUP}
    Page Should Contain Element    ${AMERICANO_INGR}
    Page Should Contain Element    ${AMERICANO_INGR_WATER}

Verify Cafe Latte
    #Cappuccino = 30% espresso + 50% steamed milk + 20% milk foam
    Page Should Contain Element    ${CAPPUCCINO}
    Page Should Contain Element    ${CAPPUCCINO_PRICE}
    Page Should Contain Element    ${CAPPUCCINO_CUP}
    Page Should Contain Element    ${CAPPUCCINO_INGR}
    Page Should Contain Element    ${CAPPUCCINO_INGR_SM}
    Page Should Contain Element    ${CAPPUCCINO_INGR_MF}

Verify Espresso Con Panna
    #Espresso Con Panna = 30% espresso + 15% whipped cream
    Page Should Contain Element    ${ESPRESSO_CON_PANNA}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_PRICE}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_CUP}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_INGR}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_INGR_WC}

Verify Cafe Breve
    #Cafe Breve = 20% espresso + 30% steamed milk + 30% steamed cream + 15% milk foam
    Page Should Contain Element    ${CAFE_BREVE}
    Page Should Contain Element    ${CAFE_BREVE_PRICE}
    Page Should Contain Element    ${CAFE_BREVE_CUP}
    Page Should Contain Element    ${CAFE_BREVE_INGR}
    Page Should Contain Element    ${CAFE_BREVE_INGR_SM}
    Page Should Contain Element    ${CAFE_BREVE_INGR_SC}
    Page Should Contain Element    ${CAFE_BREVE_INGR_MF}