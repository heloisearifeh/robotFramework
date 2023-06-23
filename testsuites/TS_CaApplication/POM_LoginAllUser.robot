*** Settings ***
Documentation    Authorisation - Login multi profil
Library    SeleniumLibrary
Resource    ../../resources/PageObject/KeywordDefinition/CommonCorrige.robot
Resource    ../../resources/PageObject/KeywordDefinition/LoginPageCorrige.robot
Resource    ../../resources/PageObject/Variables/GlobalVariables.resource
Resource    ../../resources/PageObject/Locators/GlobalLocators.resource
Resource    ../../resources/RES_VariablesGlobales.resource
*** Variables ***

*** Test Cases ***

#    [Documentation]     Pseudo code Cas de test
#    ...     Appel Keyword commun de connexion
#    ...     Appel Keyword fonctionnel de Login avec Identifiants Ok
#    ...     Appel Keyword commun de clôture

AUTH_VerificationIdentifiantsOK
    [Tags]  AUTH-OK
#    [Documentation]    Vérification de la liste des identifiants valident

    # connexion CA avec url "http://credit-auto.qsiconseil.ma/"
    Opening_Browser     ${URLCAVALIDE}    ${BROWSER_CHROME}
    # login mode all users
    Login_CA_All_Users_OK
    # close browser
    Close_Application

#AUTH_VerificationIdentifiantKO
#    [Tags]  AUTH-KO
#    [Documentation]    Vérification controle couple User/Pswd
#    # connexion CA avec url "http://credit-auto.qsiconseil.ma/"
#    Opening_Browser     ${URLCAVALIDE}    ${BROWSER_CHROME}
#    # login mode acd
#    Login_CA_Ident_KO
#    # close browser
#    Close Browser

