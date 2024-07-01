*** Settings ***
Documentation    Ações e elementos do componente Toast
Library    Browser

*** Keywords ***
Toast Should Be
    [Arguments]    ${expected_text}
    ${selector}    Set Variable    .Toastify__toast-body
    Wait For Elements State    css=${selector}    visible    5
    Get Text    css=${selector}    equal    ${expected_text}
    Take Screenshot    selector=${selector}