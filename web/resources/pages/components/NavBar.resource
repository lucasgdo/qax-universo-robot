*** Settings ***
Documentation    Ações elementos da barra de navegação
Library    Browser

*** Keywords ***
User Is Logged In
    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${email}

Go To Memberships Page
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas    visible    5