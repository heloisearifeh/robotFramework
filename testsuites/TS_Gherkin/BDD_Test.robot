*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***
    [Documentation]    BDD KDT \
    ...     Given a user has a valid account
    ...     Given a user has a valid account
    ...     When she changes her password
    ...     Then she can log in with the new password
    ...     And she cannot use the old password anymore


User Can Change Password

    Given a user has a valid account
    When she changes her password
    Then she can log in with the new password
    And she cannot use the old password anymore

*** Keywords ***

a user has a valid account
    Log     "a user has a valid account"

she changes her password
    Log     "she changes her password"

she can log in with the new password
    Log     "she can log in with the new password"

she cannot use the old password anymore
    Log     "she cannot use the old password anymore"