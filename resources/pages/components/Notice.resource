*** Settings ***
Documentation    Ações e elementos do componente Notice
Library    Browser

*** Keywords ***
Notice Should Be
    [Arguments]    ${expected}
    ${element}    Set Variable    css=form .notice
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${expected}