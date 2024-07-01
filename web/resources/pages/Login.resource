*** Settings ***
Documentation    Ações e elementos da página de Login
Library    Browser

*** Keywords ***
Go To Login Page
    Go To    http://localhost:3000/login

Submit Login Form
    [Arguments]    ${email}    ${password}
    Fill Text    css=input[name=email]    ${email}
    Fill Text    css=input[name=password]    ${password}
    Click    css=button >> text=Entrar
