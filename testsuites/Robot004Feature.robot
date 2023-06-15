*** Settings ***
Documentation    Exercices Robot Framework
#Documentation    Exercices Robot Framework

*** Variables ***
${Message_001}      Mon premier test
${Compteur}         50
${Total}            ${EMPTY}
${Nom}              Kahlo
${Prenom}           Frida
*** Test Cases ***
Mon premier Test
    [Documentation]  Utilisation du keyword Catenate
    ...     Concatenation de plusieurs textes
    [Tags]    Test1
    ${Message} =    Catenate    Mon nom est         ${Prenom}       ${Nom}
    Log     ${Message}

Mon deuxieme Test
    [Documentation]  Utilisation du keyword Should be Equal
    [Tags]    Test2
    Log Many    ${Compteur}
    Should Be Equal    ${Compteur}      50
    Should Be Equal    ${Compteur}      25
    Should Be Equal    ${Nom}           Kahlo
    Should Be Equal    ${Prenom}        Frida

Mon troisieme Test
    [Documentation]  Utilisation du keyword should contain
    [Tags]    Test3
    Log                 ${Message_001}
    Should Contain    ${Message_001}      test
    Should Contain    ${Message_001}      dupont

Mon quatrieme Test
    [Documentation]  Utilisation de IF
    [Tags]    Test4
    Log                 ${Compteur}
    IF    ${Compteur} == 50
        Log     Compteur est égal à 50
    ELSE
        Log     Compteur est différent de 50
    END

Mon cinquieme Test
    [Documentation]  Utilisation de Loop
    [Tags]    Test5
    # compteur
    FOR     ${index}    IN RANGE  1   11
        Log     ${index}
    END
    Log     Sortie de boucle
    # liste
    FOR     ${Animal}    IN     Chat    Chien   Leopard
        Log     ${Animal}
    END
    Log     Sortie de boucle

Mon sixieme Test
    [Documentation]  Utilisation de Create List
    [Tags]    Test6
    # chgt de la liste de véhicules
    @{MaListeDeVehicules}=  Create List     Voiture     Avion     Train   Vélo
    Log     ${MaListeDeVehicules}

    # liste
    FOR     ${Vehicule}    IN    @{MaListeDeVehicules}
        Log     ${Vehicule}
    END
    Log     Sortie de boucle

Mon septieme Test
    [Documentation]  Utilisation de Create Dictionary
    [Tags]    Test7
    # chgt de la liste de véhicules
    &{MonDict}=  Create Dictionary      Marque=Nissan   Puissance=66    Poids=2500      Modele=Micra

    Log     ${MonDict}

    # lecture des valeurs des clés
    ${Result}=  Evaluate    ${MonDict}.get("Marque")
    ${Result}=  Evaluate    ${MonDict}.get("Puissance")
    ${Result}=  Evaluate    ${MonDict}.get("Poids")
    ${Result}=  Evaluate    ${MonDict}.get("Modele")

    # BOUCLE
    FOR     ${key}      ${value}    IN    &{MonDict}
        Log     ${key}
        Log     ${value}
    END
    Log     Sortie de boucle


Mon huitieme Test
    [Documentation]  Utilisation du keyword Run Keyword and Continue On Failure
    Log     ${Message_001}
    Run Keyword And Continue On Failure    Should Contain    ${Message_001}     test
    Run Keyword And Continue On Failure    Should Contain    ${Message_001}     dupont
    Log     ${Message_001}

Mon neuvieme Test
    [Documentation]  Utilisation du keyword Fail
    ${Compteur}     Set Variable    52
    Log     ${Compteur}
    IF      ${Compteur} == 50
        Log     Compteur est égal à 50
    ELSE
        Log     Compteur différent de 50
        Fail
    END

*** Keywords ***
