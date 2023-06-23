*** Settings ***
Documentation    Authentication - DDT
Force Tags  POEC

Library     DataDriver  file=identifiants.xlsx  encoding=utf-8
Library     SeleniumLibrary
Resource    ../resources/CommonKeywords.robot

# Pre conditions
Suite Setup     Open Credit Auto    ${URLCAVALIDE}  ${BROWSER_CHROME}
Suite Teardown  Close Browser
Test Template   VerificationIdentifiantsOk

*** Variables ***

*** Test Cases ***
Mon Test DDT using    ${USERNAME}  and  ${PASSWORD}

*** Keywords ***
VerificationIdentifiantsOk
    [Arguments]    ${USERNAME}    ${PASSWORD}
    [Documentation]    Saisir credentials et tenter de s'identifier
    Click Link        ${LOC_BTNACCESCREDITAUTO}
    # vérifier la présence des champs attendus, sur la page de login
    Wait Until Element Is Enabled    ${LOC_INPUTUSERNAME}
    Wait Until Page Contains Element    ${LOC_INPUTPASSWORD}
    # vérifier la présence des champs attendus, sur la page de login
    Wait Until Element Is Enabled    ${LOC_INPUTUSERNAME}
    Wait Until Page Contains Element    ${LOC_INPUTPASSWORD}
    # saisir les identifiants
    Input Text    ${LOC_INPUTUSERNAME}    ${USERNAME}
    Input Text    ${LOC_INPUTPASSWORD}    ${PASSWORD}
    # clic sur le bouton Se connecter
    Click Button    ${LOC_BTNSECONNECTER}
    Click Link    ${LOC_LNKDECONNEXION}