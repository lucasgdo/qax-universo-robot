*** Settings ***
Documentation    Ações e elementos da página de Clientes
Library    Browser

*** Keywords ***

User Is Logged In
    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${email}