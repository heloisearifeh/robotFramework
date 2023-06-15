*** Settings ***
Documentation    Exercices Robot Framework
#Documentation    Exercices Robot Framework

*** Variables ***
${Message_001}      Mon premier test
${Compteur}         50
${Total}            ${EMPTY}

*** Test Cases ***
Mon premier Test
    [Documentation]  Mon premier test
    Log     ${Message_001}

Mon deuxieme Test
    [Documentation]  Mon deuxieme test
    Log     ${Compteur}

Mon troisieme Test
    [Documentation]  Mon troisieme test
    Log     ${Total}

*** Keywords ***
