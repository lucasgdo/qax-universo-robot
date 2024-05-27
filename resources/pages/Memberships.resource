*** Settings ***
Documentation    Ações e elementos da página de matrículas
Library    	Browser

*** Keywords ***
Create Membership
    [Arguments]    ${data}
    Go To Membership Form
    Select Account    ${data}[account][name]    ${data}[account][cpf]
    Select Plan    ${data}[plan][name]
    Fill Payment Data    ${data}[credit_card]
    Click    css=button[type=submit] >> text=Cadastrar

Go To Membership Form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula    visible    5

Select Account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label=select_account]    ${name}
    Click    css=[data-testid="${cpf}"]

Select Plan
    [Arguments]    ${plan}
    Fill Text    css=input[aria-label=select_plan]    ${plan}
    Click    css=div[class$=option] >> text=${plan}

Fill Payment Data
    [Arguments]    ${card}
    Fill Text    css=input[name=card_number]    ${card}[number]    
    Fill Text    css=input[name=card_holder]    ${card}[holder]
    Fill Text    css=input[name=card_month]    ${card}[month]
    Fill Text    css=input[name=card_year]    ${card}[year]
    Fill Text    css=input[name=card_cvv]    ${card}[cvv]

Search By Name
    [Arguments]    ${name}
    Fill Text    css=input[placeholder^=Busque]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1    visible    5

Should Filter By Name
    [Arguments]    ${name}
    Wait For Elements State    css=table tbody tr >> text=${name}    visible    5