*** Test Cases ***
Mon Premier Test
    [Documentation]    Essai d'appel à un Keyword spécifique
    Affichage Du Message De Bienvenue   Héloïse     F    Besançon   France
    ${retour}=  Affichage Par Return    Oscar
    Log To Console    ${retour}

*** Keywords ***
Affichage Du Message De Bienvenue
    [Documentation]    The first line creates the short doc.
        ...                This is the body of the documentation.
    [Arguments]    ${nom_de_la_personne}  ${genre}    ${ville}    ${pays}
    ${str}     Set Variable    Bienvenue
    ${genre}     Set Variable   '${genre}'
    IF  ${genre} == 'F'
        ${str} =  Catenate  ${str}   Madame
    ELSE IF    ${genre} == 'M'
        ${str} =  Catenate  ${str}   Monsieur
    END
    ${str} =     Catenate  ${nom_de_la_personne} résidant à  ${ville} en ${pays}
    Log To Console    ${str}

Affichage Par Return
    [Documentation]    The first line creates the short doc.
        ...                This is the body of the documentation.
    [Arguments]    ${nom_de_la_personne}
    ${str} =     Catenate        Bienvenue  ${nom_de_la_personne}   !
    RETURN  ${str}




