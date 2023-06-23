*** Settings ***
Library  SeleniumLibrary
#Variables  ../Locators/Locators.py
#Variables  ../Variables/Testdata.py
Resource    ../Variables/GlobalVariables.resource
Resource    ../Locators/GlobalLocators.resource
Resource    ./LoginKwObject.robot


*** Variables ***

&{ident1}    user=acd    pswd=acial!acd2018
&{ident2}    user=rcd    pswd=acial!rcd2018
&{ident3}    user=lcd    pswd=acial!acd2018
&{ident4}    user=gcd    pswd=acial!gcd2018
@{list_ident_Ok}    ${ident1}   ${ident2}   ${ident3}   ${ident4}

&{ident5}    user=acd    pswd=acial!rcd2018
&{ident6}    user=rcd    pswd=acial!2018
&{ident7}    user=lcd    pswd=None
&{ident8}    user=gcd    pswd=gcd
@{list_ident_Ko}    ${ident5}   ${ident6}   ${ident7}   ${ident8}

*** Keywords ***
Login_CA_mode_Acd
    # Click on Acces CA
    Click Element   ${URLCAVALIDE}
    # Check if login is Present
    Wait Until Page Contains Element    ${USERNAME_A}
    # Set Identifiants
    Input Text  ${LOC_INPUTUSERNAME}   ${USERNAME_A}
    Input Text  ${LOC_INPUTPASSWORD}   ${PASSWORD_A}
    Click Button    ${LOC_BTNSECONNECTER}
    # check page administrateur acd
    Wait Until Page Contains    ${LOC_DIVBIENVENUE}
    Capture Page Screenshot
    Element Should Contain   ${LOC_INDEX_TXT_PROFILENAME}  ${USERNAME_A}

Login_CA_All_Users_OK
    [Documentation]    On vérifie que tous les users peuvent s'identifier
    FOR    ${key}   IN    @{list_ident_Ok}
        Log  ${key}
        Log  ${key}[user]
        Log  ${key}[pswd]

        # Click on Acces CA
        Acces_Login_CA      ${key}[user]

        # Set Identifiants
        Login_Identifiants      ${key}[user]    ${key}[pswd]

        # check page Bienvenue
        Check_Bienvenue     ${key}[user]
    END

#Login_CA_Ident_KO
#    FOR    ${key}   IN    @{list_ident_Ko}
#        # Click on Acces CA
#        Click Element   ${lnkAccesCA}
#        # Check if login is Present
#        Wait Until Page Contains Element    ${logUsername}
#        # Set Identifiants
#        Input Text  ${logUsername}  ${key}[user]
#        Input Text  ${logPassword}  ${key}[pswd]
#        Click Button    ${logSeConnecter}
#        # check Id Invalid msg
#        Wait Until Element Is Visible   ${elmtIdInvalid}    None    None
#        # clear login Frame Should Contain
#        Click Element    ${lnkCreditAuto}
#    END


#*** Keywords ***
#Acces_Login_CA
#        [Arguments]    ${pUser}
#        # Click on Acces CA
#        Click Element   ${URLCAVALIDE}
#        # Check if login is Present
#        Wait Until Page Contains Element    ${pUser}
