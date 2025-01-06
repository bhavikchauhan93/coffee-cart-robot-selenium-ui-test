*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Begin Web Test
    Open Browser    about:blank    headlesschrome    options=add_argument("--no-sandbox")
    Maximize Browser Window

End Web Test
    Close Browser