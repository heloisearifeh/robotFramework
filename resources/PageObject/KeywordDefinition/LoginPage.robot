*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables/GlobalVariables.resource
Resource    ../Locators/GlobalLocators.resource

*** Test Cases ***

*** Keywords ***

Login_CA_mode_Acd


Login CA All Users
    FOR     ${key}  IN  @{list_ident_Ok}
        Log     ${key}
        Log     ${key}[user]
        Log     ${key}[pswd]
#        Click Element   ${lnkAccesCA}
#        Wait Until Page Contains Element    ${logUsername}
#        Input Text  ${logUsername}  ${key}[user]
#        Input Text  ${logPassword}  ${key}[pswd]
#        Click Button    ${logSeConnecter}
#        Wait Until Page Contains    ${logMsgBienvenue}
#        Capture Page Screenshot
#        Element Should Contain  ${logProfilAdm}     ${key}[user]
        Acces_Login_CA
        Login_Identifiants
        Check_Bienvenue

    END

Login_CA_Ident_KO


Acces_Login_CA
    Click Element    ${LOC_LNK_ACCUEIL}
    Wait Until Page Contains Element    ${logUsername}

Login_Identifiants
    Input Text    ${logUsername}    ${key}[user]
    Input Text    ${logUsername}    ${key}[pswd]
    Click Button    ${logSeConnecter}

Check_Bienvenue
