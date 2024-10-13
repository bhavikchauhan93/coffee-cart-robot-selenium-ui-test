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
    Log    ${ESPRESSO} available on the menu

Verify Espresso Macchiato
    #Espresso Macchiato = 30% espresso + 15% milk foam
    Page Should Contain Element    ${ESPRESSO_MACCHIATO}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_PRICE}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_CUP}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_INGR}
    Page Should Contain Element    ${ESPRESSO_MACCHIATO_INGR_MF}
    Log    ${ESPRESSO_MACCHIATO} available on the menu

Verify Cappuccino
    #Cappuccino = 30% espresso + 20% steamed milk + 50% milk foam
    Page Should Contain Element    ${CAPPUCCINO}
    Page Should Contain Element    ${CAPPUCCINO_PRICE}
    Page Should Contain Element    ${CAPPUCCINO_CUP}
    Page Should Contain Element    ${CAPPUCCINO_INGR}
    Page Should Contain Element    ${CAPPUCCINO_INGR_SM}
    Page Should Contain Element    ${CAPPUCCINO_INGR_MF}
    Log    ${CAPPUCCINO} available on the menu

Verify Mocha
    #Mocha = 30% espresso + 20% chocolate syrup + 25% steamed milk + 25% whipped cream
    Page Should Contain Element    ${MOCHA}
    Page Should Contain Element    ${MOCHA_PRICE}
    Page Should Contain Element    ${MOCHA_CUP}
    Page Should Contain Element    ${MOCHA_INGR}
    Page Should Contain Element    ${MOCHA_INGR_CS}
    Page Should Contain Element    ${MOCHA_INGR_SM}
    Page Should Contain Element    ${MOCHA_INGR_WC}
    Log    ${MOCHA} available on the menu

Verify Flat White
    #Flat White = 30% espresso + 50% steamed milk
    Page Should Contain Element    ${FLAT_WHITE}
    Page Should Contain Element    ${FLAT_WHITE_PRICE}
    Page Should Contain Element    ${FLAT_WHITE_CUP}
    Page Should Contain Element    ${FLAT_WHITE_INGR}
    Page Should Contain Element    ${FLAT_WHITE_INGR_SM}
    Log    ${FLAT_WHITE} available on the menu

Verify Americano
    #Americano = 30% espresso + 70% water
    Page Should Contain Element    ${AMERICANO}
    Page Should Contain Element    ${AMERICANO_PRICE}
    Page Should Contain Element    ${AMERICANO_CUP}
    Page Should Contain Element    ${AMERICANO_INGR}
    Page Should Contain Element    ${AMERICANO_INGR_WATER}
    Log    ${AMERICANO} available on the menu

Verify Cafe Latte
    #Cafe Latte = 30% espresso + 50% steamed milk + 20% milk foam
    Page Should Contain Element    ${CAFE_LATTE}
    Page Should Contain Element    ${CAFE_LATTE_PRICE}
    Page Should Contain Element    ${CAFE_LATTE_CUP}
    Page Should Contain Element    ${CAFE_LATTE_INGR}
    Page Should Contain Element    ${CAFE_LATTE_INGR_SM}
    Page Should Contain Element    ${CAFE_LATTE_INGR_MF}
    Log    ${CAFE_LATTE} available on the menu

Verify Espresso Con Panna
    #Espresso Con Panna = 30% espresso + 15% whipped cream
    Page Should Contain Element    ${ESPRESSO_CON_PANNA}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_PRICE}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_CUP}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_INGR}
    Page Should Contain Element    ${ESPRESSO_CON_PANNA_INGR_WC}
    Log    ${ESPRESSO_CON_PANNA} available on the menu

Verify Cafe Breve
    #Cafe Breve = 20% espresso + 30% steamed milk + 30% steamed cream + 15% milk foam
    Page Should Contain Element    ${CAFE_BREVE}
    Page Should Contain Element    ${CAFE_BREVE_PRICE}
    Page Should Contain Element    ${CAFE_BREVE_CUP}
    Page Should Contain Element    ${CAFE_BREVE_INGR}
    Page Should Contain Element    ${CAFE_BREVE_INGR_SM}
    Page Should Contain Element    ${CAFE_BREVE_INGR_SC}
    Page Should Contain Element    ${CAFE_BREVE_INGR_MF}
    Log    ${CAFE_BREVE} available on the menu

Add ${coffee} To Cart
    Wait Until Page Contains Element    //div[@aria-label='${coffee}']
    Click Element    //div[@aria-label='${coffee}']
    Log    adding ${coffee} to cart

Verify ${coffee} Added To Cart From Menu Page With ${total_price} And ${count}
    Wait Until Page Contains Element    //a[@aria-label='Cart page' and text()='cart (${count})']
    Wait Until Page Contains Element    //ul[@class='cart-preview']//li//span[normalize-space()='${coffee}']
    Page Should Contain Button    Total: $${total_price}.00
    Log    ${coffee} added to cart
    Log    ${count} coffees added to cart
    Log    Total price of all coffees is $${total_price}