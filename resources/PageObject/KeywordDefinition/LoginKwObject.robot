*** Settings ***
Library  SeleniumLibrary
Resource    ../Variables/GlobalVariables.resource
Resource    ../Locators/GlobalLocators.resource

*** Keywords ***
# Keyword Login Object
Acces_Login_CA
        [Arguments]    ${pUser}
        # Click on Acces CA
        Click Element   ${LOC_BTNACCESCREDITAUTO}
        # Check if login is Present
        Wait Until Page Contains Element    ${LOC_INPUTUSERNAME}

Login_Identifiants
        [Arguments]    ${pUser}     ${pPassword}
        # Set Identifiants
        Input Text  ${LOC_INPUTUSERNAME}    ${pUser}
        Input Text  ${LOC_INPUTPASSWORD}   ${pPassword}
        Click Button    ${LOC_BTNSECONNECTER}

Check_Bienvenue
        [Arguments]    ${pUser}
        # check page Bienvenue
        Wait Until Page Contains    ${BIENVENUE}
        #Capture Page Screenshot
        Element Should Contain   ${LOC_INDEX_TXT_USERNAME}  ${pUser}