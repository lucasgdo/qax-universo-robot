*** Settings ***
Documentation    Cenários de teste do Login SAC
Resource    ../resources/Base.resource
Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como gestor de academia
    Go To Login Page
    Submit Login Form    sac@smartbit.com    pwd123
    User Is Logged In    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]    inv_pwd
    Go To Login Page
    Submit Login Form    sac@smartbit.com    abc123
    Toast Should Be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com email não cadastrado
    [Tags]    email_404
    Go To Login Page
    Submit Login Form    404@smartbit.com    abc123
    Toast Should Be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Template]    Log In And Verify Notice
    ${EMPTY}    ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}    pwd123    Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    www.teste.com.br    pwd123    Oops! O email informado é inválido
    sac&gmail.com    pwd123    Oops! O email informado é inválido
    adsasdasdasa    pwd123    Oops! O email informado é inválido
    jhjasd79878as    pwd123    Oops! O email informado é inválido
    ^&*^&*^*&^&*     pwd123    Oops! O email informado é inválido
    test*gmail.com     pwd123    Oops! O email informado é inválido
    yahoo.com@&*     pwd123    Oops! O email informado é inválido

*** Keywords ***
Log In And Verify Notice
    [Arguments]    ${email}    ${password}    ${output_message}
    Go To Login Page
    Submit Login Form    ${email}    ${password}
    Notice Should Be    ${output_message}