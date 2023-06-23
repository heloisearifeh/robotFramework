*** Settings ***
Documentation    Authentication - Keywords globaux
Library    SeleniumLibrary
Resource    ../resources/RES_VariablesGlobales.resource



*** Keywords ***
Open Credit Auto
    [Documentation]  Ouvrir navigateur, Naviguer vers login
    [Arguments]    ${url}  ${browser}
    # arriver sur la page d'accueil puis la page de login
    Open Browser    ${url}    ${browser}
    Wait Until Location Is  ${url}