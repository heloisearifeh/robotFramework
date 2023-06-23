*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/PageObject/KeywordDefinition/Common.robot
Resource    ../../resources/PageObject/KeywordDefinition/HomePage.robot
Resource    ../../resources/PageObject/KeywordDefinition/LoginPage.robot
Resource    ../../resources/PageObject/Variables/GlobalVariables.resource
Resource    ../../resources/PageObject/Locators/GlobalLocators.resource
Resource    ../Variables/GlobalVariables.resource
Resource    ../Locators/GlobalLocators.resource


*** Test Cases ***


*** Keywords ***
Opening_Browser
    [Arguments]    ${browser}
    Open Browser    browser=${BROWSER_CHROME}
    Maximize Browser Window

Go_To
    [Arguments]    ${url}
    Go To    ${url}

Check_Accueil
    [Arguments]    ${url}
    Location Should Be  ${URLCAVALIDE}

Access_CA
    Wait Until Element Is Visible    ${LOC_BTNACCESCREDITAUTO}
    Click Link            ${LOC_BTNACCESCREDITAUTO}


Check_
    Wait Until Element Is Visible    ${LOC_LNK_ACCUEIL}
    Wait Until Element Is Visible    ${LOC_LNK_HOMECA}