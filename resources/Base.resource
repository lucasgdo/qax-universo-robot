*** Settings ***
Documentation    Arquivo principal do projeto Robot
Library    Browser
Library    JSONLibrary
Library    libs/Account.py
Library    libs/Database.py
Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource
Resource    pages/Memberships.resource
Resource    pages/components/Toast.resource
Resource    pages/components/Notice.resource
Resource    pages/components/NavBar.resource

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASSWORD}    pwd123

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

Get JSON Fixture
    [Arguments]    ${file_name}    ${scenario}
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    encoding=UTF-8
    RETURN    ${data}[${scenario}]

Sign In As Admin
    Go To Login Page
    Submit Login Form    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    User Is Logged In    ${ADMIN_EMAIL}