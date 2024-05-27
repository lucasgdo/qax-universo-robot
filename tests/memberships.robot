*** Settings ***
Documentation    Cenários de teste de adesões de planos
Resource    ../resources/Base.resource
Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    ${data}    Get JSON Fixture    memberships    create
    Delete Account By Email    ${data}[account][email]
    Insert Account    ${data}[account]
    Go To Login Page
    Sign In As Admin
    Go To Memberships Page
    Create Membership    ${data}
    Toast Should Be    Matrícula cadastrada com sucesso.

Não deve poder realizar adesão duplicada
    [Tags]    dup
    ${data}    Get JSON Fixture    memberships    duplicate
    Insert Membership    ${data}
    Go To Login Page
    Sign In As Admin
    Go To Memberships Page
    Create Membership    ${data}
    Toast Should Be    O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search
    ${name}    Set Variable    Emily Stone
    Sign In As Admin
    Go To Memberships Page
    Search By Name    ${name}
    Should Filter By Name    ${name}