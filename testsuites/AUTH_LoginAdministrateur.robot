*** Settings ***
Documentation    Authentication - Connexion Crédit Auto via URL
Library    SeleniumLibrary
Resource    ../resources/RES_VariablesGlobales.resource

*** Variables ***


*** Test Cases ***

Valid Authentication Administrateur
    [Documentation]    Cas de test passant
    [Tags]    AUTH      VALID
    Try Authentication  ${USERNAME_A}     ${PASSWORD_A}     ${URLCAVALIDE}  ${BROWSER}
    # vérifier l'ouverture de la page d'accueil en mode identifié
    Wait Until Location Is  ${URLCAINDEXVALIDE}
    Check Index Page  ${USERNAME_A}
    # Cliquer sur déconnexion
    Click Link    ${LOC_LNKDECONNEXION}
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}   ${browser}
    Open Browser    ${url}    ${browser}
    Wait Until Location Is  ${url}
    Click Link        ${LOC_BTNACCESCREDITAUTO}

Try Authentication
    [Documentation]    Saisir credentials et tenter de s'identifier
    [Arguments]    ${username}  ${password}   ${url}  ${browser}
    # arriver sur la page d'accueil puis la page de login
    Open Browser To Login Page  ${url}  ${browser}
    # vérifier la présence des champs attendus, sur la page de login
    Wait Until Element Is Enabled    ${LOC_INPUTUSERNAME}
    Wait Until Page Contains Element    ${LOC_INPUTPASSWORD}
    # saisir les identifiants
    Input Text    ${LOC_INPUTUSERNAME}    ${username}
    Input Text    ${LOC_INPUTPASSWORD}    ${password}
    # clic sur le bouton Se connecter
    Click Button    ${LOC_BTNSECONNECTER}

Check Index Page
    [Documentation]    Vérifications sur la page d'accueil d'utilisateur identifié (index)
    [Arguments]    ${username}
    # vérifier le titre de la page
    Title Should Be    ${INDEX_TITRE}
    # Vérifier la présence du div contenant le texte 'Bienvenue sur l\'application Crédit Auto'
    Element Should Be Visible    ${LOC_DIVBIENVENUE}
    # nom d'utilisateur
    Element Should Contain   ${LOC_INDEX_TXT_USERNAME}      ${username}
    # profil
    Element Should Contain   ${LOC_INDEX_TXT_PROFILENAME}     ${INDEX_TXT_VOUSETES}
    # menu
    Page Should Contain Link    ${LOC_LNK_ACCUEIL}
    Page Should Contain Link    ${LOC_LNK_CREDIT}
    # liens
    Page Should Contain Link    ${LOC_LNK_ADMISSIBILITE}
    Element Should Contain    ${LOC_TXT_CONNECTE}   ${username}
