*** Settings ***
Documentation    Exercices
Library     ExcelLibrary

*** Variables ***
${chemin}           resources/Voiture.xlsx
${sheet_name}       Feuil1
${col_marque}       1
${col_puissance}    2

*** Test Cases ***
Mon Premier Test
    [Documentation]     Lecture d'un fichier Excel

# Ouverture du fichier Excel
    Open Excel Document  ${chemin}     doc_id=docid

# Positionnement sur l'onglet Data
#   Get Sheet   Feuil1
# Lire la premiere ligne de valeurs (cellules A2 et B2)
    ${rd}=	Read Excel Row	row_num=1	sheet_name=${sheet_name}

# Afficher le contenu des cellules lues
    Log     Contenu de la première ligne
    Log     ${rd}

# Fermer le fichier Excel
    Close Current Excel Document

Parcours Des Lignes Du Fichier Excel
    [Documentation]     Lecture d'un fichier Excel

    # Ouverture du fichier Excel
    Open Excel Document  ${chemin}      doc_id=voiture

# Parcours des lignes

    ${read_columns}=  Read Excel Column    col_num=1  sheet_name=${sheet_name}
    ${nbLignes}=    Get Length    ${read_columns}

#    Log To Console  ${read_columns}
 #   Log To Console   ${nbLignes}

    ${read_rows}=	Read Excel Row	row_num=1	sheet_name=${sheet_name}
    ${nbCols}=    Get Length    ${read_rows}

#    Log To Console  ${read_rows}
#    Log To Console   ${nbCols}

    FOR     ${i}    IN RANGE    2      ${nbLignes} + 1
        ${current_row}=	Read Excel Row	row_num=${i}

        # Marque
        ${read_marque}=    Read Excel Cell     row_num=${i}    col_num=${col_marque}
        # Puissance
        ${read_puissance}=    Read Excel Cell     row_num=${i}    col_num=${col_puissance}

        Log To Console     ${current_row}
        Log Many    ${read_marque}  ${read_puissance}
    END

# Fermer le fichier Excel
    Close Current Excel Document

Parcours Des Lignes Du Fichier Excel Corrigé
    [Documentation]    Lecture de toutes les lignes d'un fichier Excel

    # Ouverture du fichier Excel
    Open Excel Document    ${CheminFichierExcel}    doc_id=docExcel

    # Positionnement sur l'onglet Data
    Get Sheet   Data

    # Récupération de la colonne 1 dans son intégralité
    ${ContenuCol1}=     Read Excel Column   1

    # Détermination du nombre de valeurs dans la colonne => Nombre de lignes
    ${NbLignes}=    Get Length    ${ContenuCol1}

    # Lecture de toutes les lignes du fichier Excel
    FOR    ${IndiceLigne}   IN RANGE    2   ${NbLignes} + 1

        # Lecture de la ligne courante
        ${Ligne}=       Read Excel Row    ${IndiceLigne}

        # Affichage de la ligne courante
        Log     ${Ligne}

        # Affichage Marque et Puissance de la ligne courante
        ${Marque}=    Read Excel Cell    ${IndiceLigne}     ${COL_MARQUE}
        ${Puissance}=    Read Excel Cell    ${IndiceLigne}     ${COL_PUISSANCE}

    END

    # Fermer le fichier Excel
    Close All Excel Documents