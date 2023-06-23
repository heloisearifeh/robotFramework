*** Settings ***

Library    SeleniumLibrary
Resource    ../../resources/PageObject/Variables/GlobalVariables.resource
Resource    ../../resources/PageObject/KeywordDefinition/CommonCorrige.robot
Resource    ../../resources/PageObject/KeywordDefinition/Common.robot

*** Test Cases ***
    [Documentation]    BDD KDT \
    ...     Scenario : Connexion CA Valide
    ...     Given un utilisateur non connecte à CA
    ...     When lURL est lancee dans un navigateur
    ...     Then la page d'accueil de lapp CA est affichee
    ...     And licone Acces Credit Auto est dispo au centre de la page
    ...     And les icones Credit Auto et Accueil sont dispo dans le bandeau menu de lapp


Connexion CA Valide
    Given un utilisateur non connecte à CA
    When lURL est lancee dans un navigateur
    Then la page d'accueil de lapp CA est affichee
    And licone Acces Credit Auto est dispo au centre de la page
    And les icones Credit Auto et Accueil sont dispo dans le bandeau menu de lapp


*** Keywords ***

un utilisateur non connecte à CA
    [Documentation]    Lancer l'url valide dans le navigateur chrome
    Log     "a user has a valid account"
    Opening_Browser     ${BROWSER_CHROME}

lURL est lancee dans un navigateur
    [Documentation]    BDD KDT \
    Log     "lURL est lancee dans un navigateur"
    Go_To    ${URLCAVALIDE}

la page d'accueil de lapp CA est affichee
    [Documentation]    BDD KDT \
    Log     "la page d'accueil de lapp CA est affichee"
    Check_Accueil   ${URLCAVALIDE}

licone Acces Credit Auto est dispo au centre de la page
    [Documentation]    BDD KDT \
    Log     "licone Acces Credit Auto est dispo au centre de la page"
    Access_CA

les icones Credit Auto et Accueil sont dispo dans le bandeau menu de lapp
    [Documentation]    BDD KDT \
    Log     "les icones Credit Auto et Accueil sont dispo dans le bandeau menu de lapp"
    Wait Until Element Is Visible    ${LOC_LNK_ACCUEIL}
    Wait Until Element Is Visible    ${LOC_LNK_HOMECA}
    Close Browser