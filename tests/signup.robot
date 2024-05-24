*** Settings ***
Documentation    Cenários de teste de pré-cadastro de clientes
Resource    ../resources/Base.resource
Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke
    ${account}    Create Dictionary    name=Fernando Papito    email=papito@msn.com    cpf=06097411871
    Delete Account By Email    ${account}[email]
    Submit Signup Form    ${account}
    Verify Welcome Message

Tentativa de pré-cadastro
    [Template]    Attempt To Signup
    ${EMPTY}    papito@gmail.com    39831866029    Por favor informe o seu nome completo
    Fernando Papito    ${EMPTY}    39831866029    Por favor, informe o seu melhor e-mail
    Fernando Papito    papito@gmail.com    ${EMPTY}    Por favor, informe o seu CPF
    Fernando Papito    papito*gmail.com    39831866029    Oops! O email informado é inválido
    Fernando Papito    papito&gmail.com    39831866029    Oops! O email informado é inválido
    Fernando Papito    www.teste.com.br    39831866029    Oops! O email informado é inválido
    Fernando Papito    HGHGHJGH    39831866029    Oops! O email informado é inválido
    Fernando Papito    kjhkjjkh^*&^&*    39831866029    Oops! O email informado é inválido
    Fernando Papito    123123    39831866029    Oops! O email informado é inválido
    Fernando Papito    papito@gmail.com    3983186602a    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    39831866011    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    7879878978    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    1    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    ^*&&*^*&    Oops! O CPF informado é inválido

*** Keywords ***
Attempt To Signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}
    ${account}    Create Dictionary    name=${name}    email=${email}    cpf=${cpf}
    Submit Signup Form    ${account}
    Notice Should Be    ${output_message}