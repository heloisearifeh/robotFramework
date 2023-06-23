*** Settings ***
Library  SeleniumLibrary
#Variables  ../Locators/Locators.py
#Variables  ../Variables/Testdata.py
Resource    ../Variables/GlobalVariables.resource
Resource    ../Locators/GlobalLocators.resource

*** Keywords ***
Opening_Browser
    [Arguments]  ${pUrl}  ${pBrowser}
    # connexion CA avec url "http://credit-auto.qsiconseil.ma/"
    Open Browser    ${pUrl}  ${pBrowser}
    #Check if link Accés Crédit Auto est présent
    Wait Until Element Is Visible  ${LOC_BTNACCESCREDITAUTO}    timeout=5
    Maximize Browser Window

Close_Application
    # deconnexion
    Click Element    ${LOC_LNKDECONNEXION}
    Close Browser