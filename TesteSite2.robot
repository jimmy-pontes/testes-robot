*** Settings ***

Library         SeleniumLibrary
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***

${URL}           http://automationpractice.com
${BROWSER}       chrome

*** Test Cases ***
Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisa
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

*** Keywords ***

Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

## Caso de Teste 02: Pesquisar produto não existente
Acessar a página home do site
    Go To   http://automationpractice.com

Conferir se a página home foi exibida
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTONAOEXIST}" no campo de Pesquisa
    Input Text   name=search_query   ${PRODUTONAOEXIST}

Clicar no botão Pesquisar
    Click Element   name=submit_search

Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""
    Title Should Be     Search - My Store
    Wait Until Element Is Visible   css=#center_column > p
